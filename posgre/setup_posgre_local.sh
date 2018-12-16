#!/bin/sh

# download psql, posgre, sample data locally on OSX 
# http://postgresguide.com/setup/example.html

# 1) Download posgre, psql
# https://wiki.postgresql.org/wiki/Homebrew
# https://postgresapp.com/
# http://postgresguide.com/setup/install.html
echo '>>> STEP1 Download posgre, psql'
brew install postgresql


# 2) Download demo DB 
# http://postgresguide.com/setup/example.html
echo '>>> STEP2 Download demo DB '
curl -L -O http://cl.ly/173L141n3402/download/example.dump
createdb pgguide
pg_restore --no-owner --dbname pgguide example.dump
psql --dbname pgguide
\d
\q  


# 3) run the demo query 
echo '>>> STEP3 Run the demo query'
echo 'TABLE LIST :'
psql  --dbname pgguide  -c "\d"
echo 'DEMO QUERY :'
psql  --dbname pgguide  -c "select * from products;"

