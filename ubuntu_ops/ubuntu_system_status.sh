#!/bin/bash



show_system_status()
{

echo "====================="
echo "the uptime is : "
echo ""
uptime 

echo "====================="
echo "CPU detial"
echo ""
# linux 
lscpu
# mac 
system_profiler SPHardwareDataType

echo "====================="
echo  "user list"
echo ""
who


echo "====================="
echo  "show my login PIDs"
echo ""
ps -l

}

#####  main 



show_system_status

# Turn ps into an realtime process viewer
watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15'




