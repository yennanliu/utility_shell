#!/bin/sh
#################################################################
# USEFUL COMMAND RUNNING OP ON HADOOP CLUSTER MACHINE 
#################################################################

<<COMMENT1

COMMENT1


# login 
chmod 600 <ssh_key>
ssh -i <ssh_key> <user>@<hadoop_ip>

# copy files to local 
scp -i  <ssh_key> -r <ssh_key> <user>@<hadoop_ip> . 
