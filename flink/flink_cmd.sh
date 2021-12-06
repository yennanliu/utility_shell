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
