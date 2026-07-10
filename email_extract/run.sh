#!/usr/bin/env bash
# Convenience wrapper around extract_emails.py.
# Safe to re-run: it resumes from the last savepoint automatically.
#
# Usage:
#   ./run.sh <path-to-mbox> [batch_size]
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MBOX_PATH="${1:?Usage: run.sh <path-to-mbox> [batch_size]}"
BATCH_SIZE="${2:-2000}"

python3 "$SCRIPT_DIR/extract_emails.py" "$MBOX_PATH" \
  --output-dir "$SCRIPT_DIR" \
  --batch-size "$BATCH_SIZE"
