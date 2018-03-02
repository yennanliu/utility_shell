#!/bin/sh


####
# https://stackoverflow.com/questions/2181712/simple-way-to-convert-hhmmss-hoursminutesseconds-split-seconds-to-seconds
# echo "00:20:40.25" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'
#### 


# KILL IDLE JOB WHICH RUN OVER 3 hours 
# fix the shell that only grab idle jons run over hours (3 hours)
# i.e. not the 05:27 like jobs, but 05:27:00 like jobs only


#======================

# print msg when execute each line 
#set -xv


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
   # https://unix.stackexchange.com/questions/145150/verify-the-length-of-a-variable
   if [ ${#k} -eq 8 ];
   #if [ expr "$k" -eq 8 ];
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


function kill_chrome_run_over_3_hour_dev() {

for ((i=3;i<=24;i++)); 
do 
if [ $i -lt 10 ];
# in case get hour parameter as : "01, 02...09"
then
   echo 'elapsed hour =' 0$i
   PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep " 0$i:" | awk '{print $1}'`"
   echo $PIDS 
   for k in ${PIDS}; do 
   # https://unix.stackexchange.com/questions/145150/verify-the-length-of-a-variable
   if [ ${#k} -eq 8 ];
   #if [ expr "$k" -eq 8 ];
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


function kill_chrome_run_over_3_hour_dev_2() {

regex='([0-9][0-9]:[0-9][0-9]:[0-9][0-9])'
#mytime=$(ps -eo pid,etime,command | grep chrome/chrome | grep -v grep | awk '{print $2}')
mytime=$(ps -eo pid,etime,command | grep top | grep -v grep | awk '{print $2}')

for time in ${mytime} ;
do
if [[ $time =~ $regex ]]; then
	echo $time done 
else 
	echo 'not fit the form ' 
fi 
done 

} 

function kill_chrome_run_over_3_hour_dev_3() {

regex='([0-9][0-9]:[0-9][0-9]:[0-9][0-9])'
#mytime=$(ps -eo pid,etime,command | grep chrome/chrome | grep -v grep | awk '{print $2}')
mytime=$(ps -eo pid,etime,command | grep top | grep -v grep | awk '{print $2}')
mypid=$(ps -eo pid,etime,command | grep top | grep -v grep | awk '{print $1}')


### create a pid - elapse time pair 
declare -A arr

arr["pids"]=$mypid
arr+=( ["etime"]=$mytime )
for key in ${!arr[@]}; do
    echo ${key} ${arr[${key}]}
done



#### 

<<COMMENT1

for time in ${mytime} ;
do
if [[ $time =~ $regex ]]; then

	echo $time 
   echo 'mypid : ' $mypid done 
else 
	echo 'not fit the form ' 
fi 
done 

COMMENT1
} 


function kill_chrome_run_over_3_hr_dev() {

for ((i=3;i<=24;i++)); 
do 
if [ $i -lt 10 ];
# for hour : 01, 02...09 
then
   echo 'elapsed hour =' 0$i
   PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep "[0-9]$i:[0-9][0-9]:[0-9][0-9]"  | awk '{print $1}'`"
   echo $PIDS 
   #for k in ${PIDS}; do { echo "Killing $k"; kill -7 $k; }; done;
   #echo "kill jobs with  PIDS : " $PIDS 
   #kill -7 $PIDS 
else 
# for hour : 10, 11... 24 
   echo 'elapsed hour  =' $i
   PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep "$i:[0-9][0-9]:[0-9][0-9]"  | awk '{print $1}'`"
   echo $PIDS 
   #for k in ${PIDS}; do { echo "Killing $k"; kill -7 $k; }; done;
   #echo "kill jobs with PIDS : " $PIDS 
   #kill -7 $PIDS 
fi 
done

}


echo "KILL idle jobs run over 3 hour"
echo ""
kill_chrome_run_over_3_hr_dev 
















