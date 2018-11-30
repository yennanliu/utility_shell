# snowflake command 



# 1) use datawarehouse 
use database datawarehouse1; 

# 2) drop datawarehousr 
drop database datawarehouse2; 

# 3) copy exist datawarehouse to the other 
# https://docs.snowflake.net/manuals/sql-reference/sql/create-database.html#examples
create database datawarehouse2 clone datawarehouse1 ;


# 4) copy table from the other exist table 
# CLONE DATAWAREHOUSE.STAGING.EASY_DATA to DATAWAREHOUSE.STAGING.EASY_DATA_DEV
create table DATAWAREHOUSE.STAGING.EASY_DATA_DEV  clone DATAWAREHOUSE.STAGING.EASY_DATA;
