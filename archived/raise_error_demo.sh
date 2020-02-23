#!/bin/sh

# https://devhints.io/bash



echo '* CASE 1  '

myfunc() {
  return 0
}


if myfunc; then
  echo "success"
else
  echo "failure"
fi


echo '* CASE 2  '


myfunc() {
  return 1
}


if myfunc; then
  echo "success"
else
  echo "failure"
fi


