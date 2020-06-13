-- 1) create table 
CREATE TABLE 
<datawarehouse>.<schema>.<table_name>
(
  "json_info" variant
);

-- 2) dump into table 
COPY INTO <datawarehouse>.<schema>.<table_name>
        FROM s3://{s3_bucket}/{s3_file}/demo.json  
        CREDENTIALS=(
          AWS_KEY_ID=<AWS_KEY_ID>
          AWS_SECRET_KEY=<AWS_SECRET_KEY>
        )
    FILE_FORMAT=(
        TYPE=json 
           ) 
    FORCE=TRUE;

-- 3) test query 

select * from <datawarehouse>.<schema>.<table_name>;

select "json_info":"cropHintsAnnotation":"cropHints" from <datawarehouse>.<schema>.<table_name>;