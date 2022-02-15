#!/bin/sh

FLINK_HOST=localhost
JOB_NAME=<JOB_NAME>


get_jobs(){

echo ''
echo '>>> job list'
curl $FLINK_HOST:8081/jobs
echo ''
}

get_jobs_overview(){

echo ''
echo '>>> job overview'
curl $FLINK_HOST:8081/jobs/overview
echo ''
}

get_job_with_status(){

JQ_QUERY=".jobs[] | select(.name == \"$JOB_NAME\" and .state == \"$job_status\").jid"
job_id=`curl -s $FLINK_HOST:8081/jobs/overview | jq "$JQ_QUERY" | egrep -o '[0-9a-z]+'`
echo $job_id
}

restarting_job(){

echo ''
echo '>>> rerun flink job ...'

cd <flink_app>
~/flink/bin/flink run -c <flink_job_class> -d <flink_app_jar> --config <config>
}

get_jobs

job_status=CANCELED
cancelled_job_id=$(get_job_with_status)

job_status=RESTARTING
restarting_job_id=$(get_job_with_status)

job_status=RUNNING
running_job_id=$(get_job_with_status)

job_status=FAILED
failed_job_id=$(get_job_with_status)

if [[ $running_job_id ]]; then
    echo $running_job_id 'is running, no need to restart ...'

elif [[ $restarting_job_id ]]; then
    echo $restarting_job_id 'is restarting, waiting ...'

elif [[ $failed_job_id && ! $running_job_id ]]; then
    echo $failed_job_id ' jobs already failed, RESTARTING now ...'
    restarting_job
fi
