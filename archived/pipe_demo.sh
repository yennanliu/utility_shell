#!/bin/sh

# https://robots.thoughtbot.com/input-output-redirection-in-the-shell

: '
### Pipes demo 

$ echo "hello there"
hello there
$ echo "hello there" | sed "s/hello/hi/"
hi there

$ echo "hello there" | sed "s/hello/hi/" | sed "s/there/robots/"
hi robots
'

# -----------------------------------
echo 'DEMO 1)'

echo "hello world"
echo "hello world" | sed "s/hello/hiya/"   # replace hello with hiya 

# -----------------------------------
echo 'DEMO 2)'

echo "hello world"
echo "hello world" | sed "s/hello/hiya/"  | sed "s/world/EARTH/"  # replace hello with hiya then replace world with EARTH

# -----------------------------------
echo 'DEMO 3)'

A=100
echo 'A =' $A
echo  'A =' $A | echo 'A + 100 =' $((A+100)) |  echo '(A + 100)*3 =' $(((A+100)*3))

# -----------------------------------
echo 'DEMO 4)'

#A=100
#echo 'A =' $A
#A=$( echo 'A+100' | bc) | echo $A
