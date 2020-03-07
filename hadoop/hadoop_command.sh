#!/bin/sh
#################################################################
# USEFUL COMMAND RUNNING OP ON HADOOP CLUSTER MACHINE 
#################################################################

# hadoop command : https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/FileSystemShell.html#cat

# 1) login 
chmod 600 <ssh_key>
ssh -i <ssh_key> <user>@<hadoop_ip>

# 2) copy files to local 
scp -i  <ssh_key> -r <ssh_key> <user>@<hadoop_ip> . 

# 3) copy file from s3 
hadoop fs -get s3://<s3_bucket>/<s3_directory>/<s3_file>

# 4) dump file to s3
hadoop fs -put <binary_file_name> s3://<s3_bucket>/<s3_directory>/<s3_file>

# 5) run hive script
hive -f <hive_script>.q 

# 6) run pig script 

# 7) list HDFS files
# hadoop fs -ls data
hadoop fs -ls 
 
# 8) view HDFS file
# hadoop fs -cat /data/kv1.txt
hdfs dfs -cat 'hdfs://localhost:9000/pig_Output/part-m-00000' 

# 9) copy emr file to HDFS 
hadoop fs -put NYC_Taxi_Pipeline/data data
