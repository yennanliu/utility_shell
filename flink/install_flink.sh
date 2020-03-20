#!/bin/sh
# https://ci.apache.org/projects/flink/flink-docs-stable/getting-started/tutorials/local_setup.html


wget http://ftp.mirror.tw/pub/apache/flink/flink-1.10.0/flink-1.10.0-bin-scala_2.11.tgz
cd Downloads 
tar xzf flink-*.tgz  ~/flink
cd flink

# start flink server 
./bin/start-cluster.sh  # Start Flink