#!/usr/bin/env python3
"""Extract unique sender/recipient email addresses from a (possibly giant) mbox file.

Resumable by design: progress is checkpointed to a state file every --batch-size
messages, so re-running the same command after a crash or manual stop picks up
right after the last message that was fully processed instead of starting over.

Usage:
    python3 extract_emails.py /path/to/file.mbox
    python3 extract_emails.py /path/to/file.mbox --batch-size 5000
    python3 extract_emails.py /path/to/file.mbox --reset   # start over

Output (written into --output-dir, default: this script's directory):
    <mbox-basename>.emails.json  - addr -> {count, as_from, as_to}
    <mbox-basename>.state.json   - {last_index, processed, total} savepoint
"""
import argparse
import json
import mailbox
import os
import sys
import tempfile
from email import policy
from email.parser import BytesParser
from email.utils import getaddresses

DEFAULT_BATCH_SIZE = 2000

# Only parse headers, not bodies/attachments -- this is what makes a giant
# mbox (with large PDF/image attachments) fast to scan: we never touch the
# MIME body at all.
_header_parser = BytesParser(policy=policy.compat32)


def _headers_only_factory(fp):
    return _header_parser.parse(fp, headersonly=True)


def atomic_write_json(path, data):
    d = os.path.dirname(path) or "."
    fd, tmp_path = tempfile.mkstemp(dir=d, prefix=".tmp-", suffix=".json")
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
        os.replace(tmp_path, path)
    except Exception:
        if os.path.exists(tmp_path):
            os.remove(tmp_path)
        raise


def load_json(path, default):
    if os.path.exists(path):
        with open(path, encoding="utf-8") as f:
            return json.load(f)
    return default


def state_paths(output_dir, mbox_path):
    base = os.path.splitext(os.path.basename(mbox_path))[0]
    state_path = os.path.join(output_dir, f"{base}.state.json")
    results_path = os.path.join(output_dir, f"{base}.emails.json")
    return state_path, results_path


def extract_addresses(msg):
    addrs = {"from": set(), "to": set()}
    for header, bucket in (("From", "from"), ("To", "to"), ("Cc", "to")):
        val = msg.get(header)
        if not val:
            continue
        for _, addr in getaddresses([val]):
            if addr:
                addrs[bucket].add(addr.strip().lower())
    return addrs


def print_summary(results, state):
    print(f"\nDone. Processed {state['processed']}/{state['total']} messages total.",
          file=sys.stderr)
    print(f"Unique addresses found: {len(results)}", file=sys.stderr)


def main():
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("mbox_path", help="Path to the .mbox file")
    parser.add_argument("--output-dir", default=os.path.dirname(os.path.abspath(__file__)),
                         help="Directory to store state + results (default: this script's dir)")
    parser.add_argument("--batch-size", type=int, default=DEFAULT_BATCH_SIZE,
                         help=f"Messages per batch before checkpointing (default: {DEFAULT_BATCH_SIZE})")
    parser.add_argument("--limit", type=int, default=None,
                         help="Stop after processing this many NEW messages this run (useful for testing)")
    parser.add_argument("--reset", action="store_true",
                         help="Ignore any existing savepoint/results and start over")
    args = parser.parse_args()

    os.makedirs(args.output_dir, exist_ok=True)
    state_path, results_path = state_paths(args.output_dir, args.mbox_path)

    if args.reset:
        for p in (state_path, results_path):
            if os.path.exists(p):
                os.remove(p)

    state = load_json(state_path, {"last_index": -1, "processed": 0, "total": None})
    results = load_json(results_path, {})  # addr -> {count, as_from, as_to}

    print(f"Opening mbox: {args.mbox_path}", file=sys.stderr)
    mbox = mailbox.mbox(args.mbox_path, factory=_headers_only_factory, create=False)
    total = len(mbox)  # one linear scan to find message boundaries (headers not parsed yet)
    state["total"] = total
    print(f"Total messages in mbox: {total}", file=sys.stderr)

    start = state["last_index"] + 1
    if start >= total:
        print("Nothing new to process; already complete.", file=sys.stderr)
        print_summary(results, state)
        return

    if start > 0:
        print(f"Resuming from message {start} (savepoint found: "
              f"{state['processed']} already processed, {len(results)} unique addresses so far)",
              file=sys.stderr)

    processed_this_run = 0
    for i in range(start, total):
        try:
            msg = mbox.get_message(i)
            addrs = extract_addresses(msg)
        except Exception as e:
            print(f"WARN: failed to parse message {i}: {e}", file=sys.stderr)
            addrs = {"from": set(), "to": set()}

        for addr in addrs["from"]:
            entry = results.setdefault(addr, {"count": 0, "as_from": 0, "as_to": 0})
            entry["count"] += 1
            entry["as_from"] += 1
        for addr in addrs["to"]:
            entry = results.setdefault(addr, {"count": 0, "as_from": 0, "as_to": 0})
            entry["count"] += 1
            entry["as_to"] += 1

        state["last_index"] = i
        state["processed"] += 1
        processed_this_run += 1

        if processed_this_run % args.batch_size == 0:
            atomic_write_json(results_path, results)
            atomic_write_json(state_path, state)
            print(f"Checkpoint: processed {i + 1}/{total} messages "
                  f"({len(results)} unique addresses so far)", file=sys.stderr)

        if args.limit and processed_this_run >= args.limit:
            print(f"Reached --limit {args.limit}; stopping early (savepoint written).",
                  file=sys.stderr)
            break

    atomic_write_json(results_path, results)
    atomic_write_json(state_path, state)
    print_summary(results, state)


if __name__ == "__main__":
    main()
