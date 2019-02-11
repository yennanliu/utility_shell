
#!/bin/sh

#################################################################
# COMMAND RUN DBT ARCHIVE
#################################################################

# https://docs.getdbt.com/docs/archival

EXECUTION_DATE=<EXECUTION_DATE> SNOWFLAKE_USER=<SNOWFLAKE_USER> SNOWFLAKE_PASSWORD=<SNOWFLAKE_PASSWORD> SNOWFLAKE_DATABASE=<SNOWFLAKE_DATABASE> SNOWFLAKE_WAREHOUSE="TMP" dbt archive --profiles-dir .
