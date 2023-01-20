#!/bin/sh

# 1) for zsh, add syntax highlighting, and replace tabs with spaces 
ls -1 /usr/share/nano/java.nanorc | sed 's/^\//include \//' >> ~/.nanorc
echo "set tabstospaces" >> ~/.nanorc
