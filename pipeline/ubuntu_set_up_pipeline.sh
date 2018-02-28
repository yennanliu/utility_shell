#!/bin/sh


cd ~
# export env variables 
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export db_url='your_db_url'
# set up digdag 
source ~/.bashrc
# to the pipeline directory 
cd /home/ubuntu/yen_dev/uk_data_team/pipeline
# push pipeline line project (.dig)
#digdag push <your_project_name>
# run digdag server (with nohup and output log)
nohup digdag server -b 0.0.0.0 -m --task-log ../task_log >> /home/ubuntu/crontab_log/digdag.log  2>&1 

