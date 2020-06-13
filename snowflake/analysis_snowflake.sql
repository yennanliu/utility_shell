# https://docs.snowflake.net/manuals/sql-reference/functions/date_trunc.html
# timestamp to datetime 
select to_date(occurred), count(*) from DATAWAREHOUSE.<ur_schema>.<ur_table> group by 1 order by 1 desc LIMIT 100 ; 
