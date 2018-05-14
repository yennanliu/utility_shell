#!/bin/sh



# run the local shell on server 
# https://askubuntu.com/questions/983141/run-local-script-in-other-machine-using-ssh


ssh -i "ec2-key.pem" <user>@host 'bash -s' < ~/utility_shell/show_crontab.sh

