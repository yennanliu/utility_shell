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

# 10) HDFS remove directory
# https://stackoverflow.com/questions/13529114/how-to-delete-a-directory-from-hadoop-cluster-which-is-having-comma-in-its-na
hdfs dfs -rm -r <directory_name>

# 11) HDFS check file size
hdfs dfs -du <directory_name>
# or
hdfs dfs -du -h <directory_name>

# 11)' HDFS check file size (in GB)
hadoop fs -du -s <directory_name>/* | awk '{s+=$1} END {printf "%.3fGB\n", s/1000000000}'

# 12) HDFS make directory if not exist
hdfs dfs -mkdir -p <new_directory_name>

# 13) HDFS list all files with condition (uid=999 in this example)
hdfs dfs -ls /user/my_user/realtime/firm=*/year=*/month=*/day=*/hour=*/uid=999 | less

# 14) find HDFS url
# https://community.cloudera.com/t5/Support-Questions/How-to-get-the-full-file-path-to-my-hdfs-root/td-p/126962
# example :
# if hdfs-site.xml is as below : 
#  <property>
#     <name>dfs.namenode.rpc-address</name>
#     <value>sandbox.hortonworks.com:8020</value>
#  </property>
# then the HDFS url should be :
# hdfs://sandbox.hortonworks.com:8020
# so, the command : 
# hadoop fs -ls hdfs://sandbox.hortonworks.com:8020
cat hdfs-site.xml | grep 8020 # get the HDFS url
hadoop fs -ls hdfs://sandbox.hortonworks.com:8020
