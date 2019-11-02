#!/bin/sh
# https://docs.aws.amazon.com/en_us/redshift/latest/dg/load-from-host-steps-run-copy.html

#################################################################
# BASH COMMANDS DUMP S3 TO REDSHIFT
#################################################################

# V0

# V1

# V2
# https://docs.treasuredata.com/articles/redshift-copy-commands
copy addresses
  from 's3://<your_s3_bucket>/<your_s3_file>'
  credentials
    'aws_access_key_id=<your_access_key_id>;aws_secret_access_key=<your_secret_access_key>'
  removequotes
  trimblanks
  truncatecolumns
  escape
  delimiter '|'
  timeformat 'YYYY-MM-DD HH:MI:SS';

# V2'
# https://teamsql.io/blog/?p=1037
# COPY tweets.training from 's3://MY_BUCKET/training.1600000.processed.noemoticon.csv.gz' 
# credentials 'aws_access_key_id=MY_ACCESS_KEY;aws_secret_access_key=MY_SECRET_KEY' 
# CSV GZIP ACCEPTINVCHARS
