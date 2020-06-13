# --------- PART 1 )  GENERAL COMMANDS 

/*

GRANT USAGE DATABASE -->. GRANT ACCESS SCHEMA --> GRANT ALL TABLES IN SCHEMA 

*/


#https://docs.snowflake.net/manuals/sql-reference/sql/grant-privilege-share.html

-- grant user to see the db 
GRANT USAGE ON DATABASE your_datawarehouse_name_DATAWAREHOUSE TO ROLE DATA_SCIENCE;

-- grant access schema 
-- https://support.snowflake.net/s/article/how-to-grant-a-role-access-to-database-objects-in-a-schema
GRANT USAGE ON SCHEMA your_datawarehouse_name_DATAWAREHOUSE.STAGING TO ROLE DATA_SCIENCE;


-- grant user to select under schema 
GRANT SELECT ON ALL TABLES IN SCHEMA your_datawarehouse_name_DATAWAREHOUSE.STAGING TO ROLE DATA_SCIENCE;



# --------- PART 2 )  BEFORE AIRFLOW


# GRANT OWNERSHIP OF ALL TABLES UNDER SCHEMA TO SYSADMIN
# https://docs.snowflake.net/manuals/sql-reference/sql/grant-ownership.html
#GRANT ownership ON ALL TABLES IN SCHEMA DATAWAREHOUSE.URBAN_AIRSHIP TO ROLE SYSADMIN copy current grants;

GRANT ownership ON ALL TABLES IN SCHEMA DATAWAREHOUSE.<ur_schema> TO ROLE SYSADMIN copy current grants;


# GRANT ALL TABLE TO TOLE 
#grant ALL  on ALL tables in schema DATAWAREHOUSE.<ur_schema> to ROLE PUBLIC;

# GRANT ALL SHEMA TO ROLE 
#GRANT ALL ON ALL SCHEMAS IN DATABASE DATAWAREHOUSE TO ROLE PUBLIC; 
