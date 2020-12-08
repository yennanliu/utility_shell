# useful sql command working with Hive

# https://kknews.cc/code/avq8rjg.html

# 1) check data strusture (e.g. partition ..)
desc <table_name>; 

# 1)' show partition
show partitions <table_name> ;

# 2) use DB
use <DB>

# 3) show DB
show databases;

# 4) show tables;
show tables;

# 5) create table
CREATE table test_table (a int, b int);

# 6) create exteranl table
CREATE external table test_change (a int, b int);

# 6)' alter table
ALTER TABLE test_change REPLACE COLUMNS ( a int, b String);

# 7) drop table
drop table test_change
