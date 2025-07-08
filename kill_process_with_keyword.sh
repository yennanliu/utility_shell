#!/bin/bash

# # Get PIDs of all running Python processes
# pids=$(ps -ef | grep 'python' | grep -v 'grep' | awk '{print $2}')

# # Check if any PIDs were found
# if [ -z "$pids" ]; then
#     echo "No Python processes found."
# else
#     # Kill the processes
#     kill -9 $pids
#     echo "Killed Python processes with PIDs: $pids"
# fi


#!/bin/bash

# Get PIDs of all running Python processes (excluding the grep command itself)
pids=$(pgrep -f 'python')

# Check if any PIDs were found
if [ -z "$pids" ]; then
    echo "✅ No Python processes found."
else
    echo "⚠️  Found Python processes with PIDs: $pids"
    
    # Kill each PID safely
    for pid in $pids; do
        echo "🔪 Killing PID $pid"
        sudo kill -9 "$pid" && echo "✅ Killed PID $pid" || echo "❌ Failed to kill PID $pid"
    done
fi