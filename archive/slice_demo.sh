#!/bin/sh

# https://devhints.io/bash


name="John"
echo ${name}
echo ${#name}       #=> "4", length of "john" 
echo ${name/J/j}    #=> "john" (substitution)
echo ${name:0:2}    #=> "Jo" (slicing)
echo ${name::2}     #=> "Jo" (slicing)
#echo ${name::-1}    #=> "Joh" (slicing)
echo ${food:-Cake}  #=> $food or "Cake"