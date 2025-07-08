# find program use port
sudo lsof -i :8080

# # Specify the port you want to kill processes on
# port=8080

# # Find the PIDs using the specific port
# pids=$(lsof -i :$port -t)

# # Check if any PIDs were found
# if [ -z "$pids" ]; then
#     echo "No processes found using port $port."
# else
#     # Kill the processes
#     kill -9 $pids
#     echo "Killed processes using port $port with PIDs: $pids"
# fi


#!/bin/bash

# Specify the port you want to kill processes on
port=8080

# Find the PIDs using the specific port
pids=$(sudo lsof -i :$port -t 2>/dev/null | sort -u)

# Check if any PIDs were found
if [ -z "$pids" ]; then
    echo "✅ No processes found using port $port."
else
    echo "⚠️  Processes using port $port: $pids"
    
    # Kill each PID safely
    for pid in $pids; do
        echo "🔪 Killing PID $pid"
        sudo kill -9 "$pid" && echo "✅ Killed PID $pid" || echo "❌ Failed to kill PID $pid"
    done
fi