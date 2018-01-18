#!/bin/sh

# KILL IDLE JOB WHICH RUN OVER 3 hours 
# fix the shell that only grab idle jons run over hours (3 hours)
# i.e. not the 05:27 like jobs, but 05:27:00 like jobs only


#======================



function kill_chrome_run_over_3_hour() {

for ((i=3;i<=24;i++)); 
do 
if [ $i -lt 10 ];
# in case get hour parameter as : "01, 02...09"
then
   echo 'elapsed hour =' 0$i
   PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep " 0$i:" | awk '{print $1}'`"
   echo $PIDS 
   for k in ${PIDS}; do 
   if [ expr ${PIDS} -eq 8 ];
   #then  echo "test (not kill) $k" ;
   then for k in ${PIDS}; do { echo "test (not kill) $k"; }; done;
   else echo 'not a hour idle job'; 
   fi 
   done 

   #echo "kill jobs with  PIDS : " $PIDS 
   #kill -7 $PIDS 
else 
# get hour parameter as "11, 12...24"
	echo 'elapsed hour  =' $i
	PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep " $i:" | awk '{print $1}'`"
	echo $PIDS 
	for k in ${PIDS}; do { echo "test (not kill) $k"; }; done;
	#echo "kill jobs with PIDS : " $PIDS 
	#kill -7 $PIDS 
fi 
done

}


echo "KILL idle jobs run over 3 hour"
echo ""
kill_chrome_run_over_3_hour 
















