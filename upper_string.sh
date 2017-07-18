#!/bin/sh


# parse sting in functions 
#https://stackoverflow.com/questions/24676564/bash-return-a-string-from-bash-function

function get ()
{
input="$1"
echo  $input 
#return $input
#eval ""
}

# upper strings 
#https://bash.cyberciti.biz/guide/Howto:_convert_string_to_all_uppercase

function capital ()
{
input="$1"
output=$(tr [a-z] [A-Z] <<< "$input")
echo $output 
}


# run 

return_var=$(get $1) 
echo 'return_var = ' $return_var

capital $1






