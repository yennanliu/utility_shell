#!/bin/sh

# http://man.linuxde.net/sed



# 1) 
echo '------------ DEMO 1 ------------ '
echo ' #### print df before op ####'
cat df_test2.csv
echo '------------ op ------------'
sed 's/car/car_xxx/g' df_test2.csv # when print, replace all "car" with "car_xxx" in df_test2.csv  
echo '#### print df again #### '
cat df_test2.csv

# 2)
echo '------------ DEMO 2 ------------ '
sed '/car/p'  df_test2.csv

# 3)
echo '------------ DEMO 3 ------------ '
sed 's:car:CAR:g'  df_test2.csv # as same as 's/car/car_xxx/g', when print, replace all "car" with "car_xxx" in df_test2.csv  


# 4)
echo '------------ DEMO 4 ------------ '
sed '/^$/d' df_test2.csv # delete blank 


# 5) 
echo '------------ DEMO 5 ------------ '
sed '$d'  df_test2.csv # delete final line 


# 6) 
echo '------------ DEMO 6 ------------ '
sed 's/^192.168.0.1/&localhost/'  df_test2.csv # replace all 192.168.0.1xxxx -> 192.168.0.1localhost











