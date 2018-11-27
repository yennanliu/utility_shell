#!/bin/sh

# https://devhints.io/bash

: '
### CONDITIONS 

[ STRING = STRING ]	Equal
[ STRING != STRING ]	Not Equal
[ -z STRING ]	Empty string
[ -n STRING ]	Not empty string
[ NUM -eq NUM ]	Equal
[ NUM -ne NUM ]	Not equal
[ NUM -lt NUM ]	Less than
[ NUM -le NUM ]	Less than or equal
[ NUM -gt NUM ]	Greater than
[ NUM -ge NUM ]	Greater than or equal
[[ STRING =~ STRING ]]	Regexp
(( NUM < NUM ))	Numeric conditions
[ -o noclobber ]	If OPTIONNAME is enabled
[ ! EXPR ]	Not
[ X ] && [ Y ]	And
[ X ] || [ Y ]	Or
'


A=abc 
B=def 
C=123
D=456
E= 

echo A = $A
echo B = $B
echo C = $C
echo D = $D
echo E = $E

echo ''


# -----------------------------------
echo 'DEMO 1)'

if [ $A = $B ] ; then 
	echo "A = B" 
else echo "A != B" 
fi 


# -----------------------------------
echo 'DEMO 2)'

if [ -z "$D" ]; then
  echo "D is empty"
elif [ -n "$D" ]; then
  echo "D is not empty"
fi 

if [ -z "$F" ]; then
  echo "F is empty"
elif [ -n "$F" ]; then
  echo "F is not empty"
fi


# -----------------------------------
echo 'DEMO 3)'

if [ $C -lt $D ] ; then  # C less than D 
	echo " C is less than D " 
else echo " C is not less than D " 
fi 


# -----------------------------------
echo 'DEMO 4)'

if [ $C -lt $D ] && [ $A  = $B  ] ; then  # C less than D  and A = B 
	echo " C is less than D and A = B " 
else echo " C is not less than D  OR A != B " 
fi 


# -----------------------------------
echo 'DEMO 5)'

if [ $C -lt $D ] || [ $A  = $B  ] ; then  # C less than D  OR A = B 
	echo " C is less than D or A = B " 
else echo " C is not less than D  and A != B " 
fi 




