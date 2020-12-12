#!/bin/sh
# https://stackoverflow.com/questions/16956810/how-do-i-find-all-files-containing-specific-text-on-linux

# 1) with keyword
grep -rnw '.' -e 'keyword'

# 2) with pattern
grep -rnw '/path/to/somewhere/' -e 'pattern'