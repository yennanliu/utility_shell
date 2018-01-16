#!/bin/sh

# KILL IDLE JOB WHICH RUN OVER 3 hours 

<<COMMENT1
"""

#http://linux.vbird.org/linux_basic/0440processcontrol/0440processcontrol-fc4.php#process_1

# 1 
# dev 
#ps aux | grep 'syslog' | grep -v 'grep'| awk '{print $2}'
#kill -SIGHUP `ps aux|grep 'syslog'|grep -v 'grep'|awk '{print $2}'`

# 2 
# https://www.unix.com/shell-programming-and-scripting/219121-kill-idle-process-using-script.html
#line=`ps -ef | grep suspect_process | grep -v grep`
#pid=`echo $line | cut -f 2 -d " "`
#minutes=`echo $line | cut -f 7 -d " " | cut -f 2 -d :`
#if [ $minutes -gt 30 ]; then
#  kill -9 $pid
#  # Record what happened to log file
#fi

# 3 
# https://serverfault.com/questions/166034/kill-all-processes-that-are-running-for-more-than-5-minutes-by-a-given-user-in-l
#kill -9 $(ps -eo comm,pid,etimes | awk '/^procname/ {if ($3 > 300) { print $2}}')
# https://serverfault.com/questions/166034/kill-all-processes-that-are-running-for-more-than-5-minutes-by-a-given-user-in-l

# 4 
# This script will kill process which running more than X hours
# egrep: the selected process; grep: hours
#PIDS="`ps eaxo bsdtime,pid,comm | egrep "spamd|exim|mysqld|httpd" | grep " 1:" | awk '{print $2}'`"
# Kill the process
#echo "Killing processes running more than one hour..."
#for i in ${PIDS}; do { echo "Killing $i"; kill -9 $i; }; done;


"""
COMMENT1


#======================




function kill_chrome_run_over_1_day() {
# FINAL VERSION 
# get PIDS which job (job with crome keyword ) run over 1 day 
#PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome|mysqld|httpd" | grep " 1-" | awk '{print $1}'`"
PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep " 1-" | awk '{print $1}'`"
# print PIDS 
echo $PIDS 
# kill all jobs with selected pids 
for i in ${PIDS}; do { echo "Killing $i"; kill -7 $i; }; done;
#kill -7 $PIDS 
}


function kill_chrome_run_over_3_hour() {

for ((i=3;i<=24;i++)); 
do 
if [ $i -lt 10 ];
# in case get hour parameter as : "01, 02...09"
then
   echo 'elapsed hour =' 0$i
   PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep " 0$i:" | awk '{print $1}'`"
   echo $PIDS 
   for k in ${PIDS}; do { echo "Killing $k"; kill -7 $k; }; done;
   #echo "kill jobs with  PIDS : " $PIDS 
   #kill -7 $PIDS 
else 
# get hour parameter as "11, 12...24"
	echo 'elapsed hour  =' $i
	PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep " $i:" | awk '{print $1}'`"
	echo $PIDS 
	for k in ${PIDS}; do { echo "Killing $k"; kill -7 $k; }; done;
	#echo "kill jobs with PIDS : " $PIDS 
	#kill -7 $PIDS 
fi 
done

# print PIDS 
#echo $PIDS 
# kill all jobs with selected pids 
#for i in ${PIDS}; do { echo "Killing $i"; kill -7 $i; }; done;
#kill -7 $PIDS 
}


echo "KILL idle jobs run over 1 day"
echo ""
kill_chrome_run_over_1_day

echo "KILL idle jobs run over 3 hour"
echo ""
kill_chrome_run_over_3_hour 
















