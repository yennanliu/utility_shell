# find program use port
sudo lsof -i :8080

# Specify the port you want to kill processes on
port=8080

# Find the PIDs using the specific port
pids=$(lsof -i :$port -t)

# Check if any PIDs were found
if [ -z "$pids" ]; then
    echo "No processes found using port $port."
else
    # Kill the processes
    kill -9 $pids
    echo "Killed processes using port $port with PIDs: $pids"
fi
