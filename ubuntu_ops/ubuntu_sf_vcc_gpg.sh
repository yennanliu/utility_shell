#!/bin/bash
# install sshpass on mac/ubuntu 
# brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

current_date="$(date +'%Y%m%d')"
echo $current_date
echo $db_url 
echo $User
echo $Host 

psql $db_url -c"\COPY (SELECT * FROM rw.job_health limit 10 ) To 'test$current_date.csv' WITH CSV HEADER DELIMITER ','"
file_name="test$current_date.csv"
echo $file_name
sshpass -p $password sftp -oport=22 $User@$Host << !
put $file_name /Import
!
rm $file_name
