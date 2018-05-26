#!/bin/sh


func()
{
echo '-----------'
echo "epoch = $#" # show how many times function run 
echo '-----------'
echo "# 1 parameter = $1" # show 1st parameter
echo "# 2 parameter = $2" # show 2rd parameter
echo "# 3 parameter = $3" # show 3rd parameter

}


func 
func 1 
func 1 2 
func  1 2 3