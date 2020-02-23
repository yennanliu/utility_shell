#!/bin/sh

# https://devhints.io/bash


myfunc() {
    local myresult='THIS IS THE VALUE TO RETURN'
    echo $myresult
}

get_return_value(){

myresult2=$(myfunc)
echo 'Return from the other func : '  $myresult2  

}


myresult=$(myfunc)
echo ' ***  Return from func : '  $myresult
echo ' ***  Return from the other func : ' &&  get_return_value

