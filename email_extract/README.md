# email_extract

Extracts unique sender/recipient email addresses from a (possibly huge) `.mbox`
file, efficiently and resumably.

## Why this exists

A giant mbox export (e.g. Gmail's "All Mail including Spam and Trash") can be
many GB with large attachments. Re-parsing the whole thing from scratch every
time you tweak something, or losing all progress if a run gets killed halfway,
is wasteful. This tool:

- **Only parses headers**, never message bodies/attachments (`From`, `To`,
  `Cc`) — this is what makes scanning large attachments fast, since the MIME
  body is never touched.
- **Processes in batches** and checkpoints to disk every `--batch-size`
  messages (default 2000).
- **Resumes automatically**: re-running the same command picks up right after
  the last checkpoint instead of reprocessing everything.

## Files

- `extract_emails.py` — main script, does the extraction + checkpointing.
- `summarize.py` — reads the results file and prints a top-N table.
- `run.sh` — thin convenience wrapper around `extract_emails.py`.

## Usage

```bash
# First run (or resumed run — same command either way)
python3 extract_emails.py "/path/to/your.mbox"

# Or via the wrapper:
./run.sh "/path/to/your.mbox" [batch_size]
```

Progress is printed to stderr as it goes:

```
Opening mbox: /path/to/your.mbox
Total messages in mbox: 48213
Checkpoint: processed 2000/48213 messages (612 unique addresses so far)
Checkpoint: processed 4000/48213 messages (901 unique addresses so far)
...
Done. Processed 48213/48213 messages total.
Unique addresses found: 1187
```

If you Ctrl-C it or it crashes midway, just run the exact same command again —
it will say `Resuming from message N (savepoint found: ...)` and continue
instead of starting over.

To force a clean restart (ignore any existing savepoint):

```bash
python3 extract_emails.py "/path/to/your.mbox" --reset
```

### Printing N unique emails

```bash
python3 summarize.py "your.emails.json" -n 10
```

Options:
- `--role {any,from,to}` — only show addresses that appeared as a sender / a
  recipient / either (default `any`).
- `--sort-by {count,as_from,as_to,addr}` — sort by total appearances, times
  seen as sender, times seen as recipient, or alphabetically.

Example: top 10 senders only

```bash
python3 summarize.py "your.emails.json" -n 10 --role from --sort-by as_from
```

## Output files

Written into `--output-dir` (defaults to this script's directory), named
after the mbox file's basename:

- `<basename>.emails.json` — the accumulated result:
  ```json
  {
    "notifications@github.com": {"count": 42, "as_from": 40, "as_to": 2},
    "xxx@gmail.com": {"count": 38, "as_from": 0, "as_to": 38}
  }
  ```
- `<basename>.state.json` — the savepoint:
  ```json
  {"last_index": 4199, "processed": 4200, "total": 48213}
  ```

Both files are written atomically (write to a temp file, then rename), so a
crash mid-checkpoint can't corrupt them.

## Notes / limitations

- Message keys in a freshly-opened `mailbox.mbox` are sequential integers
  assigned in file order, so resuming by index is safe as long as the mbox
  file itself isn't modified between runs (don't edit/re-export it mid-run).
- Building the message-boundary index (`len(mbox)`) re-scans the file once per
  run — this is a cheap linear scan (just finding `From ` separator lines), not
  a re-parse of headers, so it stays fast even across many resumes. The
  expensive part (header parsing + address extraction) is what's actually
  skipped for already-processed messages.
- `--limit N` processes only N *new* messages this run, useful for testing on
  a slice before committing to a full run.
