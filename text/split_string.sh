#!/bin/bash
# https://zaiste.net/posts/shell-split-string-reading-file/

while IFS=':' read -r name role
do
  echo $name
  echo $role
done < data/test2.txt