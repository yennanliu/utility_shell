#!/bin/sh

# specify a password to psql non-interactively?
# https://stackoverflow.com/questions/6405127/how-do-i-specify-a-password-to-psql-non-interactively

"""


# example 1 

export PGPASSWORD='password'
psql -h 'server name' -U 'user name' -d 'base name' \
     -c 'command' (eg. "select * from schema.table")


# example 2 

### Please export following env variables first in case connect to posgre server 

export PGPASSWORD=<password>
export host=<hostname>
export port=<portname>
export username=<username>
export dbname=<dbname>

"""



#export PGPASSWORD='password'
psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
select  * from prc.sdb_members_dev limit 4;
EOF











