#!/bin/sh
#################################################################
# HELP SCRIPT PARTITION S3 FILES 
#################################################################

from_bucket=s3://<from_s3_bucket>/<s3_file>
to_bucket=s3://<to_s3_bucket>/<s3_partiton_file>
s3_files=`aws s3 ls s3://<from_s3_bucket>/<s3_file> | cut -d " " -f 4`

for s3_file in $s3_files;
    do 
       to_file=$(echo $s3_file | cut -d " "  -f 4 | cut -d "_" -f 2 | cut -d "." -f 1)
       echo "copy" $from_bucket/$s3_file "to" $to_bucket/$to_file/$s3_file 
       aws s3 cp $from_bucket/$s3_file $to_bucket/$to_file/$s3_file
    done 