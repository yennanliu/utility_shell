#!/bin/sh

# https://devhints.io/bash

: '

### Numeric calculations
$((a + 200))      # Add 200 to $a
$((RANDOM%=200))  # Random number 0..200

'

# -----------------------------------
echo 'DEMO 1)'

mynumber=100
echo 'mynumber = ' mynumber
echo 'mynumber + 100 =' $((mynumber+100))
echo 'mynumber - 10 ='  $((mynumber-10))
echo 'mynumber * 10 ='  $((mynumber*10))
echo 'mynumber / 50 ='  $((mynumber/50))

# -----------------------------------
echo 'DEMO 2)'

echo 'Random number 0..200 =' $((RANDOM%=200))  # Random number 0..200