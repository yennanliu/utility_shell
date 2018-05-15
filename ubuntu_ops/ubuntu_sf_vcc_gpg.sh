#!/bin/bash
# install sshpass on mac/ubuntu 
# brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb

current_date="$(date +'%Y%m%d')"
echo $current_date
echo $db_url 
echo $sftp_user
echo $Host 
echo $recipient_mail 

echo 'query DB....'
psql $db_url -c"\COPY (SELECT * FROM rw.job_health limit 10 ) To 'test$current_date.txt' WITH CSV HEADER DELIMITER '|'"
file_name="test$current_date.txt"
echo $file_name
echo 'encrypt the data....'
gpg --encrypt --recipient $recipient_mail  $file_name
echo 'to sftp....'
sshpass -p $password sftp -oport=22 $sftp_user@$Host << !
put $file_name.gpg /Import
!
#rm $file_name
rm $file_name.gpg
