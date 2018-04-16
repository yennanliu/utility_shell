#!/bin/bash

# extract data from Posgre, and dump the data to the defined SFTP location

current_date="$(date +'%Y%m%d')"
echo $current_date
psql "posgre_credential" -c"\COPY (SELECT * FROM test) To 'test$current_date.csv' WITH CSV HEADER DELIMITER ','"
file_name="test$current_date.csv"
echo $file_name
sshpass -p "sftp_pass" sftp -oport=2222 <sftp_user>@<sftp_host> << !
put $file_name <sftp_file_upload_route>
!
rm $file_name