#!/bin/sh

what_day()
{
date +%A
}

is_monday()
{
	if [ 'what_day'="monday" ] # run function command inside the other function 
	then 
		return 0 # ture 
	else
		return 1 # false 
	fi 
}

echo '-----------'
echo "today is : "  
what_day
echo '-----------'
is_monday && echo "it's weekday"
is_monday || echo "it's weekend"
echo '-----------'