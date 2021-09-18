#!/bin/sh

#################################################################
# USEFUL COMMAND FOR ACCESSING POSGRE DB VIA PSQL 
#################################################################

# https://dba.stackexchange.com/questions/1285/how-do-i-list-all-databases-and-tables-using-psql
# https://stackoverflow.com/questions/10335561/use-database-name-command-in-postgresql

<<COMMENT1
yennanliu@yennanliu-MacBook-Pro:~/data_science_repo/de_airflow_docker_dev$ psql
psql (10.1)
Type "help" for help.

yennanliu=# \l
                              List of databases
   Name    |   Owner   | Encoding | Collate | Ctype |    Access privileges    
-----------+-----------+----------+---------+-------+-------------------------
 pgguide   | yennanliu | UTF8     | C       | UTF-8 | 
 postgres  | yennanliu | UTF8     | C       | UTF-8 | 
 template0 | yennanliu | UTF8     | C       | UTF-8 | =c/yennanliu           +
           |           |          |         |       | yennanliu=CTc/yennanliu
 template1 | yennanliu | UTF8     | C       | UTF-8 | =c/yennanliu           +
           |           |          |         |       | yennanliu=CTc/yennanliu
 yennanliu | yennanliu | UTF8     | C       | UTF-8 | 
(5 rows)

yennanliu=# \c pgguide
You are now connected to database "pgguide" as user "yennanliu".
pgguide=# \d
                   List of relations
 Schema |         Name          |   Type   |   Owner   
--------+-----------------------+----------+-----------
 public | products              | table    | yennanliu
 public | products_id_seq       | sequence | yennanliu
 public | purchase_items        | table    | yennanliu
 public | purchase_items_id_seq | sequence | yennanliu
 public | purchases             | table    | yennanliu
 public | purchases_id_seq      | sequence | yennanliu
 public | users                 | table    | yennanliu
 public | users_id_seq          | sequence | yennanliu
(8 rows)

pgguide=# select * from  products limit 3 ;
 id |    title    | price |       created_at       | deleted_at |           tags            
----+-------------+-------+------------------------+------------+---------------------------
  1 | Dictionary  |  9.99 | 2011-01-01 20:00:00+00 |            | {Book}
  2 | Python Book | 29.99 | 2011-01-01 20:00:00+00 |            | {Book,Programming,Python}
  3 | Ruby Book   | 27.99 | 2011-01-01 20:00:00+00 |            | {Book,Programming,Ruby}
(3 rows)

pgguide=# \q
yennanliu@yennanliu-MacBook-Pro:~/data_science_repo/de_airflow_docker_dev$ 
COMMENT1

# 1) connect to local posgre via psql 
psql
# or psql -U postgres --password and password : 0000 (ur computer pwd)

# 2) list all database 
\l 

# 3) list all table 
\d 

# 4) switch to database with name  
\c <ur_bd_name>

# 5) quit psql 
\q 
