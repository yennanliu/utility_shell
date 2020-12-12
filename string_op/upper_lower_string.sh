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
function to_capital ()
{
input="$1"
output=$(tr [a-z] [A-Z] <<< "$input")
echo "upper case :  $output"
}

function to_lower ()
{
input="$1"
output=$(tr [A-Z] [a-z]  <<< "$input")
echo "lower case : $output"
}

# run 
return_var=$(get $1) 
echo 'return_var (input) = ' $return_var

to_capital $1
to_lower $1
