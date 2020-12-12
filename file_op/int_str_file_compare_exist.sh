#!/bin/sh

echo '-------------'
echo '#### compare between integer  ####'
echo '0: true , 1 : false'

[ 2 -gt 1 ]
echo $?
echo '-------------'
[ 1 -gt 2 ]
echo $?
echo '-------------'
echo '#### compare between string  ####'
x=100
y=80
[ $x -gt $y ]
echo $?
echo '-------------'
echo '#### integer operation  ####'
x=100
y=80
let "y+=200"
[ $x -gt $y ]
echo $?
echo '-------------'
echo '#### check if string is null ####'
mystring=""
echo $mystring
[ -z $mystring ]
echo $?
echo '-------------'
echo '#### check if file exist ####'
[ -e /Users/yennanliu/utility_shell/README.md ]
echo $?
echo '-------------'
echo '#### check if directory exist ####'
[ -d /Users/yennanliu/utility_shell/docker ]
echo $?
echo '-------------'
