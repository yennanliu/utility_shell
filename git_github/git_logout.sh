#!/bin/bash
# Logout current GitHub credentials and remove global user.name, user.email
# https://gist.github.com/richchurcher/531b0452d7d5ea983daa314d0876f60a


echo -e "host=github.com\nprotocol=https\n" | git credential-osxkeychain erase
git config --unset-all --global user.name
git config --unset-all --global user.email