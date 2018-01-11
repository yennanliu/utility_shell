#!/bin/sh
# https://github.com/fengyuhetao/shell/tree/master/mysql%E6%95%B0%E6%8D%AE%E5%BA%93



# launch mysql server (local), connect to mysql 

# check mysql dbs 

mysql  -u root -e "show databases;"


# check mysql tables 

mysql  -u root -e "use information_schema ; show tables ; "


# sample select 


mysql -u root <<EOF
use local_dev ; 
select * from movie_metadata limit 2 ; 
EOF

# show all tables in dbs 


DBS=$(mysql  -u root -e "show databases;")
n=1
for db in ${DBS[@]}
#for db in ${DBS[@];x>n;x++}
do

echo $db
mysql  -u root -e "use $db ; show tables ; "

done 



