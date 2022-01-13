#!/bin/sh

# generate flink savepoint and save to HDFS 

FLINK_HOME=<ur_flink_home>

FLINK_HOST=$1
JOB_NAME=$2

echo FLINK_HOST=$FLINK_HOST
echo JOB_NAME=$JOB_NAME

JQ_QUERY=".jobs[] | select(.name == \"$JOB_NAME\" and .state == \"RUNNING\").jid"
JOB_ID=`curl -s $FLINK_HOST:8081/jobs/overview | jq "$JQ_QUERY" | egrep -o '[0-9a-z]+'`
$FLINK_HOME/bin/flink savepoint $JOB_ID
