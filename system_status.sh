#!/bin/bash



show_system()
{

echo "====================="
echo "the uptime is : "
uptime 

echo "====================="
echo "CPU detial"
# linux 
lscpu
# mac 
system_profiler SPHardwareDataType

echo "====================="
echo  "user list"
who


}

#####  main 



show_system






