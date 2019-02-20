#!/bin/sh

#################################################################
# COMMAND RUN DBT COMPILE IN MAC CLI   
#################################################################


# under dbt_project 
# please check the dbt official doc. 



# step 1) set up dev schema 
EXECUTION_DATE=<EXECUTION_DATE> SNOWFLAKE_USER=<SNOWFLAKE_USER> SNOWFLAKE_PASSWORD=<SNOWFLAKE_PASSWORD> SNOWFLAKE_DATABASE=<SNOWFLAKE_DATABASE> SNOWFLAKE_WAREHOUSE="TMP"  dbt archive  --profiles-dir . --model=<dbt_model_name>  

EXECUTION_DATE=<EXECUTION_DATE> SNOWFLAKE_USER=<SNOWFLAKE_USER> SNOWFLAKE_PASSWORD=<SNOWFLAKE_PASSWORD> SNOWFLAKE_DATABASE=<SNOWFLAKE_DATABASE> SNOWFLAKE_WAREHOUSE="TMP"  dbt seed  --profiles-dir . --model=<dbt_model_name>  

# step 2). run dbt 
EXECUTION_DATE=<EXECUTION_DATE> SNOWFLAKE_USER=<SNOWFLAKE_USER> SNOWFLAKE_PASSWORD=<SNOWFLAKE_PASSWORD> SNOWFLAKE_DATABASE=<SNOWFLAKE_DATABASE> SNOWFLAKE_WAREHOUSE="TMP"  dbt run  --profiles-dir . --model=<dbt_model_name>  

