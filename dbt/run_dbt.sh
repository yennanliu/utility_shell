#!/bin/sh

#################################################################
# COMMAND RUN DBT COMPILE IN MAC CLI   
#################################################################


# under dbt_project 
# please check the dbt official doc. 

EXECUTION_DATE=<EXECUTION_DATE> SNOWFLAKE_USER=<SNOWFLAKE_USER> SNOWFLAKE_PASSWORD=<SNOWFLAKE_PASSWORD> SNOWFLAKE_DATABASE=<SNOWFLAKE_DATABASE> SNOWFLAKE_WAREHOUSE="TMP"  dbt run  --profiles-dir . --model=<dbt_model_name>  

