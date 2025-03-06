#!/bin/bash

# Find the process ID of the running ssh-agent and kill it
ps aux | grep ssh-agent | grep -v grep | awk '{print $2}' | xargs -I {} kill -9 {}

# Start a new ssh-agent session
eval "$(ssh-agent -s)"

# Set up a SOCKS proxy (using ssh) through the given server
ssh -D 8085 <ip>
