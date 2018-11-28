#!/bin/sh

# https://devhints.io/bash


: '
### Defining arrays
Fruits=('Apple' 'Banana' 'Orange')
Fruits[0]="Apple"
Fruits[1]="Banana"
Fruits[2]="Orange"

### Working with arrays
echo ${Fruits[0]}           # Element #0
echo ${Fruits[@]}           # All elements, space-separated
echo ${#Fruits[@]}          # Number of elements
echo ${#Fruits}             # String length of the 1st element
echo ${#Fruits[3]}          # String length of the Nth element
echo ${Fruits[@]:3:2}       # Range (from position 3, length 2)

### Operations
Fruits=("${Fruits[@]}" "Watermelon")    # Push
Fruits+=('Watermelon')                  # Also Push
Fruits=( ${Fruits[@]/Ap*/} )            # Remove by regex match
unset Fruits[2]                         # Remove one item
Fruits=("${Fruits[@]}")                 # Duplicate
Fruits=("${Fruits[@]}" "${Veggies[@]}") # Concatenate
lines=(`cat "logfile"`)                 # Read from file

### Iteration
for i in "${arrayName[@]}"; do
  echo $i
done
'



# -----------------------------------
echo 'DEMO 1)'

Fruits=('Apple' 'Banana' 'Orange') # define an array 
echo ${Fruits[0]}      #"Apple"
echo ${Fruits[1]}      #"Banana"
echo ${Fruits[2]}      #"Orange"
echo ${Fruits[@]}      # all elemebts (i.e. 'Apple' 'Banana' 'Orange' in this case)
echo ${#Fruits[@]}     # number of all elemebts (i.e. 3 in this case)
echo ${#Fruits[2]}     # String length of the Nth element (i.e. length of Orange in this case)
######################
echo ${Fruits[@]:0:2}  # Range (from position 0, length 2)
######################


# -----------------------------------
echo 'DEMO 2)'
Fruits2=('Apple' 'Banana' 'Orange')      # define an array 
Fruits2=("${Fruits[@]}" "Watermelon")    # Push
echo ${Fruits2[@]}                       # Apple Banana Orange Watermelon
unset Fruits2[2]                         # Remove one item
echo ${Fruits2[@]}                       # Apple Banana Orange Watermelon

Fruits3=("${Fruits2[@]}")                # Duplicate
echo ${Fruits3[@]}                       # Apple Banana Orange Watermelon


# -----------------------------------
echo 'DEMO 3)'
Fruits4=('Apple' 'Banana' 'Orange')      # define an array 

for i in "${Fruits4[@]}" ; do 
	echo $i 
done 




