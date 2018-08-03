#!/bin/sh

# specify a password to psql non-interactively?
# https://stackoverflow.com/questions/6405127/how-do-i-specify-a-password-to-psql-non-interactively




# =========================

echo '-------------'
echo 'delete table before update.... (ana.members_table)'
echo '-------------'


psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
DROP TABLE IF EXISTS ana.members_table ;
EOF

# =========================

echo '-------------'
echo 'build the table.....'
echo '-------------'



psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF

CREATE TABLE ana.members_table AS
  (SELECT *  FROM ana.members)
; 
EOF


# =========================

echo '-------------'
echo 'testing select'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
SELECT count(*)
FROM ana.members_table ;
EOF










