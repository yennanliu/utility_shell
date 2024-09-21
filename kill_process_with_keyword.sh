#!/bin/bash

# Get PIDs of all running Python processes
pids=$(ps -ef | grep 'python' | grep -v 'grep' | awk '{print $2}')

# Check if any PIDs were found
if [ -z "$pids" ]; then
    echo "No Python processes found."
else
    # Kill the processes
    kill -9 $pids
    echo "Killed Python processes with PIDs: $pids"
fi
