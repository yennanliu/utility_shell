#!/bin/sh

# copy local file to emr 
scp -i Downloads/yen_aws_yahoo_keypair.pem -r HadoopHelloWorld/README.md hadoop@ec2-44-233-116-24.us-west-2.compute.amazonaws.com:
# copy local directory to emr
scp -i Downloads/yen_aws_yahoo_keypair.pem -r HadoopHelloWorld/data hadoop@ec2-44-233-116-24.us-west-2.compute.amazonaws.com:
