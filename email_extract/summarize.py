#!/usr/bin/env python3
"""Print a quick summary/top-N from the *.emails.json produced by extract_emails.py.

Usage:
    python3 summarize.py <mbox-basename>.emails.json
    python3 summarize.py <mbox-basename>.emails.json -n 10
    python3 summarize.py <mbox-basename>.emails.json -n 10 --role from --sort-by as_from
"""
import argparse
import json


def main():
    parser = argparse.ArgumentParser(description=__doc__,
                                      formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("results_json", help="Path to *.emails.json produced by extract_emails.py")
    parser.add_argument("-n", "--top", type=int, default=10, help="How many addresses to print (default: 10)")
    parser.add_argument("--sort-by", choices=["count", "as_from", "as_to", "addr"], default="count")
    parser.add_argument("--role", choices=["any", "from", "to"], default="any",
                         help="Only show addresses seen as sender / recipient / either")
    args = parser.parse_args()

    with open(args.results_json, encoding="utf-8") as f:
        results = json.load(f)

    items = list(results.items())
    if args.role == "from":
        items = [(a, v) for a, v in items if v["as_from"] > 0]
    elif args.role == "to":
        items = [(a, v) for a, v in items if v["as_to"] > 0]

    if args.sort_by == "addr":
        items.sort(key=lambda kv: kv[0])
    else:
        items.sort(key=lambda kv: kv[1][args.sort_by], reverse=True)

    print(f"Total unique addresses: {len(results)}")
    print(f"Showing top {min(args.top, len(items))} by {args.sort_by} (role={args.role}):\n")
    for addr, v in items[: args.top]:
        print(f"{v['count']:>6}  (from={v['as_from']:<5} to={v['as_to']:<5})  {addr}")


if __name__ == "__main__":
    main()
