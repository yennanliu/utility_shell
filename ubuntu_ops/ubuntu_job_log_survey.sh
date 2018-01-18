#!/bin/sh

cd ~
cd crontab_log


for entry in `ls $pwd`; do
#for entry in `ls /home/ubuntu/crontab_log`; do
	echo $entry
done



