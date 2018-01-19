#!/bin/sh

<<COMMENT1
PIDS="`ps -eo pid,cmd,etime | grep chrome/chrome | egrep "chrome" | grep " 0$i:" | awk '{print $1}'`"
echo $PIDS 
for k in ${PIDS}; 
do 
if [ expr ${PIDS} -eq 8 ];
then  echo " $k" ;
else echo 'not a hour idle job'; 
 
fi 
done 
COMMENT1



# pid 
echo ''
echo 'pid :'
ps -eo pid,etime,command | grep top | grep -v grep | awk '{print $1}'

echo ''
echo 'etime :'
# elapsed etime 
ps -eo pid,etime,command | grep top | grep -v grep | awk '{print $2}'

# elapsed etime  to minute 
ps -eo pid,etime,command | grep top | grep -v grep | awk '{print $2}' | awk -F: '{ print + ($1 * 60) + $2 }'


# check time form 
mytime=$(ps -eo pid,etime,command | grep top | grep -v grep | awk '{print $2}' | awk -F: '{ print + ($1 * 60) + $2 }')
echo 'mytime :'  $mytime 
#ps -eo pid,etime,command | grep top | grep -v grep | awk '{print $2}' | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'
#echo "00:20:40.25" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'



## if logic 



mytime2='02:12:12'

regex='([0-9][0-9]:[0-9][0-9]:[0-9][0-9])'

if [[ $mytime2 =~ $regex ]]; then
	echo $mytime2 ' fit the hr:mm:ss form '  
else 
	echo $mytime2 'not fit the form  hr:mm:ss'  
fi

#echo "$line" 







