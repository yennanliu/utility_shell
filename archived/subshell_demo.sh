#!/bin/sh

# https://devhints.io/bash

: '
### EXAMPLE 
(cd somedir; echo 'I am now in $PWD')
pwd # still in first directory
'

# -----------------------------------
echo 'DEMO 1)'

(cd  && ls  && pwd && echo "I am here  (subshell):  $PWD" )
echo "I am here  (shell):  $PWD"