#!/bin/sh



#echo 'db_url : '  $db_url
#psql  << EOM $db_url EOM 



echo 'db_url : '  $db_url
psql $db_url << EOF
select  * from prc.sdb_members_dev limit 4;
EOF


#psql $host $dbname $username $password $port  << EOF
#select  * from prc.sdb_members_dev limit 4;
#EOF