#!/bin/sh


# snowflake command 
# ref 
# https://docs.snowflake.net/manuals/user-guide/data-load-external-tutorial.html


# 1) make a Stage Object
# https://docs.snowflake.net/manuals/user-guide/data-load-external-tutorial-create-stage.html
create or replace file format table_stage
  type = 'CSV'
  field_delimiter = '|'
  skip_header = 1;
  
# 2) copy stage into table 
# https://docs.snowflake.net/manuals/user-guide/data-load-external-tutorial-copy-into.html
create or replace stage table_stage 
  file_format = sample_data
  url = s3://<s3_bucket>/<s3_key> ;


# 2') copy into table 
COPY INTO <DATAWAREHOUSE>.<table> 
    FROM s3://<s3_bucket>/<s3_key>  
    CREDENTIALS=(
        AWS_KEY_ID='☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺'
        AWS_SECRET_KEY='☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺'
    )


