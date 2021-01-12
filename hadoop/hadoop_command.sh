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
# Ref 1)
# http://hadoop.apache.org/docs/r3.0.0/hadoop-project-dist/hadoop-common/FileSystemShell.html#du
# * du
# 	Usage: hadoop fs -du [-s] [-h] [-v] [-x] URI [URI ...]
#
# 	Displays sizes of files and directories contained in the given directory or the length of a file in case its just a file.
#
# 	Options:
#
# 		The -s option will result in an aggregate summary of file lengths being displayed, rather than the individual files. Without the -s option, calculation is done by going 1-level deep from the given path.
# 		The -h option will format file sizes in a “human-readable” fashion (e.g 64.0m instead of 67108864)
# 		The -v option will display the names of columns as a header line.
# 		The -x option will exclude snapshots from the result calculation. Without the -x option (default), the result is always calculated from all INodes, including all snapshots under the given path.
#
# Ref 2)
# https://www.edureka.co/community/2733/how-to-check-size-of-hdfs-directory
# The first column shows the actual size (raw size) of the files that users have placed in the various HDFS directories.
# The second column shows the actual space consumed by those files in HDFS.

# hdfs dfs -du <directory_name>
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
# or you could find the key word (8080) within all files 
# https://stackoverflow.com/questions/16956810/how-do-i-find-all-files-containing-specific-text-on-linux
grep -rnw '.' -e '8020'

# 13) compress file (BZip2Codec)
hadoop jar <hadoop_home>/hadoop-streaming-3.1.1.3.1.4.0-315.jar \
  -Dmapred.job.name=compress_job \
  -Dmapred.reduce.tasks=5 \
  -Dmapred.output.compression.codec=org.apache.hadoop.io.compress.BZip2Codec \
  -Dmapreduce.output.fileoutputformat.compress.codec=org.apache.hadoop.io.compress.BZip2Codec \
  -input $input \
  -output $output
 
# 14) check hdfs file size/count
for y in {2018..2021}
  do
   for m in {1..12}
     do 
      for d in {1..31}
        do
          echo "----"
          path=hdfs://<hdfs_path>/acc=*/aid=*/date=$y-$m-$d/hour=*
          echo $path
          echo "file size :"
          hadoop fs -du -s $path | awk '{s+=$1} END {printf "%.3fGB\n", s/1000000000}'
          echo "file count :"
          hdfs dfs -ls $path | wc -l
        done
    done
 done
 
# 15) Change the Owner and Group of a File 
# https://linuxize.com/post/linux-chown-command/
# https://www.youtube.com/watch?v=i2sDhe3jVu0&list=PLmOn9nNkQxJEs3ixNOLlilPnNarGtywL9&index=18
# chown USER:GROUP FILE
# example :
# sudo chown dev_user:dev_user /opt/dev/file
