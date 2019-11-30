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

# # 3) run a simple pyspark job with emr 
# # https://stackoverflow.com/questions/23302184/running-pyspark-script-on-emr
# aws emr add-steps --cluster-id j-ON9Z8VHKC8FD \
#     --steps Name=Spark,Jar=s3://eu-west-1.elasticmapreduce/libs/script-runner/script-runner.jar,Args=[/home/hadoop/spark/bin/spark-submit,--deploy-mode,cluster,s3://etl-spark-bucket/pyspark_script/spark_helloworld.py],ActionOnFailure=CONTINUE


# 4) Create an EMR with S3 pyspark  (and terminate it when job completed/failed)
aws emr create-cluster \
    --applications Name=Hadoop Name=Spark \
    --ec2-attributes '{"InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-ab8f8ee0","EmrManagedSlaveSecurityGroup":"sg-0a78143ccac876690","EmrManagedMasterSecurityGroup":"sg-03d310bc88ddb1633"}' \
    --release-label emr-5.28.0 \
    --log-uri 's3n://aws-logs-437885434504-us-west-2/elasticmapreduce/' \
    --steps '[{"Args":["spark-submit","--deploy-mode","cluster","s3://etl-spark-bucket/pyspark_script/spark_helloworld.py"],"Type":"CUSTOM_JAR","ActionOnFailure":"TERMINATE_CLUSTER","Jar":"command-runner.jar","Properties":"","Name":"Spark 應用程式"}]' \
    --instance-groups '[{"InstanceCount":1,"InstanceGroupType":"MASTER","InstanceType":"m3.xlarge","Name":"Master Instance Group"},{"InstanceCount":2,"InstanceGroupType":"CORE","InstanceType":"m3.xlarge","Name":"Core Instance Group"}]' \
    --configurations '[{"Classification":"spark","Properties":{}}]' \
    --auto-terminate \
    --service-role EMR_DefaultRole \
    --enable-debugging \
    --name 'yen-emr-pyspark' \
    --scale-down-behavior TERMINATE_AT_TASK_COMPLETION \
    --region us-west-2


# 5) Create an EMR with S3 scala jar (and terminate it when job completed/failed)
aws emr create-cluster \
    --auto-scaling-role EMR_AutoScaling_DefaultRole \
    --applications Name=Hadoop Name=Hive Name=Pig Name=Hue Name=Spark \
    --ec2-attributes '{"KeyName":"yen_aws_yahoo_keypair","InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-0fe38d24","EmrManagedSlaveSecurityGroup":"sg-0a78143ccac876690","EmrManagedMasterSecurityGroup":"sg-03d310bc88ddb1633"}' \
    --service-role EMR_DefaultRole \
    --enable-debugging \
    --release-label emr-5.28.0 \
    --log-uri 's3n://aws-logs-437885434504-us-west-2/elasticmapreduce/' \
    --steps '[{"Args":["spark-submit","--deploy-mode","cluster","--class","EmrHelloworld.emr_helloworld","s3://etl-spark-bucket/spark_jar/spark_emr_dev-assembly-1.0.jar"],"Type":"CUSTOM_JAR","ActionOnFailure":"TERMINATE_CLUSTER","Jar":"command-runner.jar","Properties":"","Name":"Spark 應用程式"}]' \
    --name '我的叢集' \
    --instance-groups '[{"InstanceCount":2,"EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":32,"VolumeType":"gp2"},"VolumesPerInstance":2}]},"InstanceGroupType":"CORE","InstanceType":"m5.xlarge","Name":"核心 - 2"},{"InstanceCount":1,"EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":32,"VolumeType":"gp2"},"VolumesPerInstance":2}]},"InstanceGroupType":"MASTER","InstanceType":"m5.xlarge","Name":"主節點 - 1"}]'  \
    --auto-terminate \
    --service-role EMR_DefaultRole \
    --enable-debugging \
    --name 'yen-emr-scala-jar' \
    --scale-down-behavior TERMINATE_AT_TASK_COMPLETION \
    --region us-west-2
