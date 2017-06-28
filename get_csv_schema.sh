#!/bin/sh





# get 1 csv schema 
#cat df_test.csv  | head -n 1 




filename=$1
firstline=$2
lastline=$3

echo $filename
echo $firstline



i=0   

num_file=$(ls *.csv  | wc -l)
echo 'num of file = ' $num_file

for filename in ./*.csv; do 
echo 'filename = ' $filename
# Assign Output of Shell Command To Variable
# var=$(command-name-here)
# https://www.cyberciti.biz/faq/unix-linux-bsd-appleosx-bash-assign-variable-command-output/
schema=$(cat $filename |  head -n 1)
echo ''
echo 'schema = '  $schema
echo ''
echo '======='

  
   i=$(( $i + 1 ))                       
 
done



