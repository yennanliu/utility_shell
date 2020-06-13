#!/bin/sh

#################################################################
# COMMAND COPY ALL FILTED S3 FILES TO DB 
#################################################################

COPY INTO <dw_name>.<schema_name>.<table_name>
FROM s3://<s3_bucket_name>
CREDENTIALS=(
    AWS_KEY_ID=''
    AWS_SECRET_KEY=''
)
FILE_FORMAT=(
    VALIDATE_UTF8=FALSE
    TYPE=CSV
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
    ERROR_ON_COLUMN_COUNT_MISMATCH=True
    SKIP_HEADER=1
)
PATTERN='.*<s3_file_name>.*[.]csv[.]gz'
