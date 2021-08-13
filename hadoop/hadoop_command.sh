#!/bin/sh
#################################################################
# USEFUL COMMAND RUNNING OP ON HADOOP CLUSTER MACHINE 
#################################################################

# hadoop command : https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/FileSystemShell.html#cat

# 0) show all hidden files
# https://www.tecmint.com/hide-files-and-directories-in-linux/#:~:text=To%20view%20hidden%20files%2C%20run,al%20flag%20for%20long%20listing.&text=From%20a%20GUI%20file%20manager,view%20hidden%20files%20or%20directories.
ls -al <path>

# 0)' Change file permission (root -> user)
# sudo chown user@user module/ -R
 sudo chown <user>@<user> <file_name>/ -R

# 1) login 
chmod 600 <ssh_key>
ssh -i <ssh_key> <user>@<hadoop_ip>

# 2) push file from current server to another server
# -r : recursion
# pattern :  scp -r $pdir/$filename $user@$host$pdir/$filename
# https://www.youtube.com/watch?v=hrZv4xG6VHM&list=PLmOn9nNkQxJEs3ixNOLlilPnNarGtywL9&index=85
# https://www.youtube.com/watch?v=GkqVLAEK_08&list=PLmOn9nNkQxJEs3ixNOLlilPnNarGtywL9&index=33
# scp -r module root@haoop102:/opt/module
scp -r <file> <user>@<hadoop_ip>/<file>

# 2)' pull file from another server to here
# scp -r module user@haoop101:/opt/module ./
scp -r <user>@<hadoop_ip>/<file> <file> 

# 2)'''' copy from the other server to another server
# scp -r root@haoop101:/opt/module root@haoop104:/opt/module
scp -r <user>@<hadoop1_ip>/<file> <user>@<hadoop2_ip>/<file>

# 2)''' copy files to local 
scp -i  <ssh_key> -r <ssh_key> <user>@<hadoop_ip> . 

# 3) copy file from s3 
hadoop fs -get s3://<s3_bucket>/<s3_directory>/<s3_file>

# 3)' copy from HDFS to HDFS
# https://hadoop.apache.org/docs/r2.4.1/hadoop-project-dist/hadoop-common/FileSystemShell.html
hdfs dfs -cp  <HDFS_PATH_1> <HDFS_PATH_2>

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
# 10)' HDFS delete by batch
# check by hdfs dfs -count <path> to see the no. of files -> and delete in each batch

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
# or 
hdfs dfs -du -h -s <directory_name>  # sum 

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

# 16) count HDFS files
hdfs dfs -count <HDFS_FILE_PATH>/*

# 17) read HDFS data
hdfs dfs -text  <HDFS_FILE> 

# 17)' read HDFS data (first 3 lines)
# https://stackoverflow.com/questions/22090833/get-a-few-lines-of-hdfs-data
hdfs dfs -text  <HDFS_FILE> | shuf -n 3

# 18) distcp (copy HDFS files)
hadoop distcp \
 -Dmapred.job.name='distcp job' \
 -Dmapreduce.job.hdfs-servers.token-renewal.exclude=<name_service> \
 -Dmapreduce.map.memory.mb=8192 -Dmapred.job.reduce.memory.mb=8192 \
 -atomic -p -m 200 -bandwidth 4000 \
 $from_path $to_path
 
# 19) compress HDFS
# we need "-mapper "cut -f 1" in the compress command to remove key prefix in the output data 
# https://stackoverflow.com/questions/7153087/hadoop-compress-file-in-hdfs/9572706
hadoop jar share/hadoop/tools/lib/hadoop-streaming-3.1.1.3.1.4.0-315.jar \
 -Dmapred.job.name=compress_job \
 -Dmapred.reduce.tasks=5 \
 -Dmapreduce.output.fileoutputformat.compress=true \
 -Dmapred.output.compression.codec=org.apache.hadoop.io.compress.BZip2Codec \
 -Dmapreduce.output.fileoutputformat.compress.codec=org.apache.hadoop.io.compress.BZip2Codec \
 -input $from_path \
 -output $to_path -mapper "cut -f 1"
 
 # 20) use different hadoop clinet (same server)
 # kdestroy : destroy current hadoop client profile
 kdestroy && source <hadoop_client>/.bashrc &&  KRB5_CONFIG='<hadoop_client>/krb5.conf' kinit -kt <hadoop_key_tab>.keytab user@aaa.HADOOP.bbb.COM
 
 # 20) get checksum
 # https://stackoverflow.com/questions/31920033/checksum-verification-in-hadoop
 # note : checksum can only work on SINGLE file, if want to check multiple files, need to for loop every file
 #  -> hadoop java client offers lib doing "recursive" hdfs dfs -ls 
 #  -> https://hadoop.apache.org/docs/r2.8.2/api/org/apache/hadoop/fs/FileSystem.html
 #  -> https://hadoop.apache.org/docs/r2.8.2/api/org/apache/hadoop/fs/FileStatus.html
 #  -> example scala code : val subPaths = fs.listFiles(basePath, true)
hdfs dfs -checksum  <hdfs_file_path>

# 21) get stats (file created time ..)
# https://www.edureka.co/community/6712/hadoop-fs-stat-command
hdfs dfs -stat   <hdfs_file_path>

# 22) permission
# https://hadoop.apache.org/docs/r2.4.1/hadoop-project-dist/hadoop-common/FileSystemShell.html
# -chgrp, -chmod, -chown

# Change group association of files.
hdfs dfs -chgrp  <hdfs_file_path>

# Change the permissions of files
hdfs dfs -chmod  <hdfs_file_path>

# Change the owner of files
hdfs dfs -chown  <hdfs_file_path>

# 23) HDFS Resource Manager API (hadoop 3.x)
# https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/ResourceManagerRest.html
# curl http://<HDFS_RM_URI>:8088/ws/v1/cluster
# curl http://<HDFS_RM_URI>:8088/ws/v1/cluster/apps

# 23) check if HDFS path exists
hdfs dfs -test -d <hdfs_path>

# 24) check HDFS last modified time
# https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/FileSystemShell.html#stat
# https://www.reddit.com/r/bigdata/comments/cbhk9p/is_there_a_way_to_find_the_last_accessed_time_of/
# https://www.modb.pro/db/27010
#-----------------------------------------------------------------------------------------
# NOTE :
# atime : file last access time
# mtime : file's data last modified time (file content was changed)
# ctime : file status last changed time (could be write in, auth change, link...)
#------------------------------------------------------------------------------------------
hadoop fs -stat "type:%F perm:%a %u:%g size:%b mtime:%y atime:%x name:%n" <Complete_HDFS_Path>

# 25) Force closing a HDFS file still open (because uncorrectly copied)
# https://community.cloudera.com/t5/Support-Questions/Force-closing-a-HDFS-file-still-open-because-uncorrectly/td-p/180647
hdfs debug recoverLease -path <hdfs_path>
