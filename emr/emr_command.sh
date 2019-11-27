#!/bin/sh
#################################################################
# AWS EMR HELP COMMAND
#################################################################

# 0) AWS CLI config
aws configure 
# yennanliu@yennanliu-MBP:~/utility_shell(master○) » aws configure
# AWS Access Key ID [****************HQ6I]: 
# AWS Secret Access Key [****************A3B0]: 
# Default region name [us-west-2]: 
# Default output format [json]: 

# 1) create an emr and make it termate with finished launch process
# http://queirozf.com/entries/creating-a-spark-cluster-on-aws-emr-a-tutorial
aws emr create-cluster \
    --name "my emr 1-node cluster" \
    --instance-type m3.xlarge \
    --release-label emr-4.1.0 \
    --instance-count 1 \
    --use-default-roles \
    --applications Name=Spark \
    --auto-terminate

# 2) run a simple spark job with emr 
# http://queirozf.com/entries/creating-a-spark-cluster-on-aws-emr-a-tutorial
# step.json demo :
# [
#   {
#     "Name": "Sample AWS EMR Spark Job",
#     "Type":"CUSTOM_JAR",
#     "Jar":"command-runner.jar",
#     "Args":
#     [
#       "spark-submit",
#       "--deploy-mode", "cluster",
#       "--class", "ProcessData",
#       "s3://my-example-bucket/jars/ProcessData.jar",
#       "s3://my-example-bucket/input-files",
#       "s3://my-example-bucket/output-files"
#     ],
#     "ActionOnFailure": "TERMINATE_CLUSTER"
#   }
# ]
aws emr create-cluster \
    --name "Sample Spark Cluster with a single Job" \
    --instance-type m3.xlarge \
    --release-label emr-4.1.0 \
    --instance-count 1 \
    --use-default-roles \
    --applications Name=Spark \
    --steps file://step.json \
    --auto-terminate

# 3) run a simple pyspark job with emr 
# https://stackoverflow.com/questions/23302184/running-pyspark-script-on-emr
aws emr add-steps --cluster-id j-ON9Z8VHKC8FD \
    --steps Name=Spark,Jar=s3://eu-west-1.elasticmapreduce/libs/script-runner/script-runner.jar,Args=[/home/hadoop/spark/bin/spark-submit,--deploy-mode,cluster,s3://etl-spark-bucket/pyspark_script/spark_helloworld.py],ActionOnFailure=CONTINUE
