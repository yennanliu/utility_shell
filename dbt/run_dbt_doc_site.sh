#!/bin/sh

#################################################################
# COMMAND RUN DBT DOC (DB schema) WEBSITE
#################################################################


# step 1 ) generate doc. 
EXECUTION_DATE='2018-04-17' SNOWFLAKE_USER=<SNOWFLAKE_USER> SNOWFLAKE_PASSWORD=<SNOWFLAKE_PASSWORD> SNOWFLAKE_DATABASE=<SNOWFLAKE_DATABASE> SNOWFLAKE_WAREHOUSE=<SNOWFLAKE_WAREHOUSE> dbt docs generate   --profiles-dir .

# step 2) run the server 
EXECUTION_DATE='2018-04-17' SNOWFLAKE_USER=<SNOWFLAKE_USER> SNOWFLAKE_PASSWORD=<SNOWFLAKE_PASSWORD> SNOWFLAKE_DATABASE=<SNOWFLAKE_DATABASE> SNOWFLAKE_WAREHOUSE=<SNOWFLAKE_WAREHOUSE> dbt docs serve  --profiles-dir .


