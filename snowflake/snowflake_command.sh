# snowflake command 



# 1) use datawarehouse 
use database datawarehouse1; 

# 2) drop datawarehousr 
drop database datawarehouse2; 

# 3) copy exist datawarehouse to the other 
# https://docs.snowflake.net/manuals/sql-reference/sql/create-database.html#examples
create database datawarehouse2 clone datawarehouse1 ;


