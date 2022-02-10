#!/bin/sh

#-------------------------------------------------
# General Bash/Shell Util code
#-------------------------------------------------

# 1) check if a variable exist/non-exist

if [[ $x ]]; then
    echo "x exists"

elif [[ $y ]]; then
    echo "y exists"

elif [[ ! $x && ! $y ]]; then
    echo "both x and y not exists"
fi

# 2) for loop
my_array=()

for i in {00..23}
do 
    echo $i
    my_array+=($i)
done

# output 1
echo "${my_array[@]}"

# output 2
for i in "${my_array[@]}"; 
    do
        echo "${my_array[$i]}"
    done
