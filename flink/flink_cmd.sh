#!/bin/sh

#------------------------------
# flink 1.12
#------------------------------

# run
~/flink/bin/flink run -c <class_name> -d <built_jar> --config <conf>

# run with checkpoint
~/flink/bin/flink run -s <save_point> -c <class_name> -d <built_jar> --config <conf>

# cancel job without save point
~/flink/bin/flink cancel <job_id>
 
# cancel the job with save point
~/flink/bin/flink cancel -s <job_id> 

# generate save point
# https://github.com/yennanliu/utility_shell/blob/master/flink/save_point.sh
bash /utility_shell/flink/save_point.sh <JM_hostname> '<FLINK_JOB_NAME>' > "$HOME/savepoint/savepoint_<FLINK_JOB_NAME>_$(date +\%Y\%m\%d\%H\%M\%S)"
