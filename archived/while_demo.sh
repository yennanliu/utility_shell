#!/bin/sh
num=0
sum=0

while [ $num -le 20 ]  ; 
    do 
        let "sum += num"
        echo  'num :' $num
        echo  'sum :' $sum
        let "num = num+1"
    done 