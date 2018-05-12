

#!/bin/sh




read -r filename


#echo ${#filename}

while  [ ! -f $filename ] && [ ${#filename} -gt 0 ] ; 
do 
	echo $filename 'not exist'
	read -r filename 

done 
	if [ ${#filename} -eq 0 ] ; then 
		echo 'null input filename (file not exist)'
	else 
		echo  $filename 'exist'
	fi 

