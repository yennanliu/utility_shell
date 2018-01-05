#!/bin/sh

#http://linux.vbird.org/linux_basic/0440processcontrol/0440processcontrol-fc4.php#process_1


# dev 
ps aux | grep 'syslog' | grep -v 'grep'| awk '{print $2}'
kill -SIGHUP `ps aux|grep 'syslog'|grep -v 'grep'|awk '{print $2}'`