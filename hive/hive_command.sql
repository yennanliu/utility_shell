# useful sql command working with Hive

# https://kknews.cc/code/avq8rjg.html

# 1) check data strusture (e.g. partition ..)
desc <table_name>; 

# 1)' show partition
show partitions <table_name> ;

# 1)'' create db
CREATE DATABASE  test_db;

# 2) use DB
use test_db;

# 3) show DB
show databases;

# 4) show tables;
show tables;

# 4)' show table details
DESCRIBE FORMATTED test_table PARTITION (my_column='my_value');

# 5) create table
CREATE table test_table (a int, b int);

# 6) create exteranl table
CREATE external table test_change (a int, b int);

# 6)' alter table
ALTER TABLE test_change REPLACE COLUMNS ( a int, b String);

# 7) drop table
drop table test_change

# 8) load external jar (deserialize json for example)
SET LIB_DIR = /usr/local/common/lib;
ADD JAR ${hiveconf:LIB_DIR}/json-serde-1.3.9-jar-with-dependencies.jar;

# 9) alter table
ALTER TABLE test_table SET SERDEPROPERTIES ('ignore.malformed.json' = 'true');

# 10) load HDFS data into table (dev)
# load hdfs raw data into hive table
load data inpath '<hdfs_data_path>' into table test_table; --partition(uid=1557);
