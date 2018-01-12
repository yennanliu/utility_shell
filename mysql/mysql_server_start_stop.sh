#!/bin/sh

# a shell start/stop mysql local server 

# mysql server start 
#mysql.server start
# mysql server stop  
#mysql.server stop


function local_mysql_server_start () {
 echo "mysql.server start"
 mysql.server start
 exit 0 ; 
}


function local_mysql_server_stop () {
 #mysql.server stop
 echo "mysql.server stop"
 mysql.server stop
 exit 0 ; 

}



while true  
do
clear
echo "Choose an action: a, b or c  "
echo "a: mysql server start"
echo "b: mysql server stop"
echo "c: Exit"
read -sn1
#REPLY=$(to_upper "$REPLY")
case "$REPLY"  in
	a) local_mysql_server_start;; 
	b) local_mysql_server_stop ;;
	c) exit 0 ;;
esac 

read -n1 -p "Press any key to continue"
done




