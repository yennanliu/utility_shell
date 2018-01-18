#!/bin/sh


PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep " 0$i:" | awk '{print $1}'`"
echo $PIDS 
for k in ${PIDS}; 
if [ expr ${PIDS} -eq 8 ]
do { echo " $k" }; done;
else
	echo 'not a hour idle job'
fi 
done 