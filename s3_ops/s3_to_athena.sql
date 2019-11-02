# https://stackoverflow.com/questions/45313763/athena-query-fails-with-boto3-s3-location-invalid

-- dump data from s3 to athena
CREATE EXTERNAL TABLE `uber-taxi-zone`(
  `locationid` string, 
  `borough` string, 
  `zone` string)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://yennanliu-s3/dev-data-upload/taxi-zone'
TBLPROPERTIES (
  'has_encrypted_data'='false')

-- query data
SELECT * FROM
 "yens3"."uber-taxi-zone" limit 10;