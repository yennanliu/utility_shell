#!/bin/sh

# https://robots.thoughtbot.com/input-output-redirection-in-the-shell

: '
### Printf demo 

printf 'Hello %s, I am  %s' Sven Olga

'

# -----------------------------------
echo 'DEMO 1)'

printf 'Hello %s, I am  %s ' OLIVIA YEN

# -----------------------------------
echo 'DEMO 2)'

printf 'SELECT * FROM %s LIMIT 10 ' ETL_LOG

# -----------------------------------
echo 'DEMO 3)'

#printf 'TODAY IS : %s' $date
# dev 