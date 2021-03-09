#!/bin/sh
# https://stackoverflow.com/questions/618378/select-unique-or-distinct-values-from-a-list-in-unix-shell-script

# uniq will output all lines exactly once
cat file_name | uniq 

# uniq -d will output all lines that appear more than once, and it will print them once:
cat file_name | uniq  -d

# uniq -u will output all lines that appear exactly once, and it will print them once:
cat file_name | uniq  -u