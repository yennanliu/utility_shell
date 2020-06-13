#!/bin/sh

#################################################################
# COMMAND HELP ACCESS SNOWFLAKE CLI   
#################################################################

# Congratulations! Software installation complete.
# Complete the following steps to connect to Snowflake:
#     1.    Open a new terminal window.
#     2.    Execute the following command to test your connection:
# snowsql -a <account_name> -u <login_name>
# Enter your password when prompted. Enter !quit to quit the connection. 
#     3.    Add your connection information to the ~/.snowsql/config file:
# accountname = <account_name>
# username = <account_name>
# password = <password> 
#     4.    Execute the following command to connect to Snowflake:
# snowsql
# or double click the SnowSQL application icon in the Applications directory. 

# See the Snowflake documentation https://docs.snowflake.net/manuals/user-guide/snowsql.html for more information.


# 1) access CLI
snowsql -a <account_name> -u <user_name>

# 2) RUN MULTIPLE COMMAND AS .sql 
# https://docs.snowflake.net/manuals/user-guide/snowsql-use.html#running-while-connecting-f-connection-parameter
snowsql -a <account_name> -u <user_name> -f <sql_command>.sql  
