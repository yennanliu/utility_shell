
#https://docs.snowflake.net/manuals/sql-reference/sql/grant-privilege-share.html

# grant user to see the db 
GRANT USAGE ON DATABASE your_datawarehouse_name_DATAWAREHOUSE TO ROLE DATA_SCIENCE;

# grant user to select under schema 
GRANT SELECT ON ALL TABLES IN SCHEMA your_datawarehouse_name_DATAWAREHOUSE.IMPACT TO ROLE DATA_SCIENCE;


