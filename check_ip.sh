#!/bin/sh





# ref 
# http://ifconfig.me/#cli_wrap



myip="$(curl ifconfig.me/ip)"
echo $myip