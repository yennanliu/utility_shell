#!/bin/sh

#################################################################
# COMMAND COPY ALL FILTED S3 JSON FILES TO DB 
#################################################################

COPY INTO <dw_name>.<schema_name>.<table_name>
FROM s3://<s3_bucket_name>
CREDENTIALS=(
    AWS_KEY_ID=''
    AWS_SECRET_KEY=''
)
FILE_FORMAT=(
    VALIDATE_UTF8=FALSE
    TYPE=JSON
)
PATTERN='.*<s3_file_name>.*[.]json[.]gz'