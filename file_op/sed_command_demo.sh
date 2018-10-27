#!/bin/sh

# http://man.linuxde.net/sed



# 1) 
echo '------------ DEMO 1 ------------ '
echo ' #### print df before op ####'
cat df_test2.csv
echo '------------ op ------------'
sed 's/car/car_xxx/g' df_test2.csv
echo '#### print df again #### '
cat df_test2.csv


# 2)
#echo 'DEMO 2 '
#sed 's/book/books/g' file

