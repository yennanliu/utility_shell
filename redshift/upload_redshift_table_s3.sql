-- https://docs.aws.amazon.com/redshift/latest/dg/t_Unloading_tables.html
-- https://stackoverflow.com/questions/24681214/unloading-from-redshift-to-s3-with-headers

--  1) select all 
UNLOAD ('SELECT * FROM <db_name>.<table_name>;')
TO 's3://<s3_bucket>/<s3_file>/<s3_file_name>.csv' CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>' 
ALLOWOVERWRITE
delimiter ',' 
HEADER 
PARALLEL OFF ;

-- 2) select limit count  
UNLOAD ('SELECT * FROM (SELECT * FROM <db_name>.<table_name>) LIMIT 10 ;')
TO 's3://<s3_bucket>/<s3_file>/<s3_file_name>.csv' CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>' 
ALLOWOVERWRITE
delimiter ',' 
HEADER 
PARALLEL OFF ;