#!/bin/bash

# https://stackoverflow.com/questions/17368067/length-of-string-in-bash/31009961
# https://linuxize.com/post/bash-if-else-statement/

hdfs_acc=`hdfs dfs -ls <hdfs_data_path>`

for acc in ${hdfs_acc[@]};
  do
    IFS='/' read -r -a array <<< "$acc"
    tmp=${array[13]}
        if [ ${#tmp} -gt 1 ];
            then echo $tmp;
        fi  
  done;
