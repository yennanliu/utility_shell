

-- step 1) : create table 

CREATE TABLE "YENNANL_DEVELOPMENT_DATAWAREHOUSE"."ADYEN"."YEN_DEV00" ("json" variant);


-- step 2) : upload file to s3 

-- step 3) : copy file from s3 to snowflake 

COPY INTO YENNANL_DEVELOPMENT_DATAWAREHOUSE.ADYEN.YEN_DEV00
FROM s3://data.noths.com/yen_vision/gcloud_web_entity_response.json CREDENTIALS=( AWS_KEY_ID=<AWS_KEY_ID> AWS_SECRET_KEY=<AWS_SECRET_KEY> ) 
FILE_FORMAT=( TYPE=JSON FIELD_DELIMITER = ',')
FORCE=TRUE;

    
-- step 4) : test query 

SELECT value:"json":"url"::varchar AS url,
                    value:"json":"cropHintsAnnotation" AS json_,
                                 value:"json":"cropHintsAnnotation":"cropHints" AS cropHints
FROM YENNANL_DEVELOPMENT_DATAWAREHOUSE.ADYEN.YEN_DEV00 "a",
     LATERAL FLATTEN(INPUT => "a"."json", OUTER => TRUE) "b"