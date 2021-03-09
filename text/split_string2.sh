# #!/bin/sh
# https://riptutorial.com/bash/example/27007/split-string-into-an-array-in-bash

my_param="foo,bar,bash"
IFS=',' read -r -a array <<< "$my_param"

# get 1st one
echo "${array[0]}"

# get all
for element in "${array[@]}"
do
    echo "$element"
done

# get index and value
for index in "${!array[@]}"
do
    echo "$index ${array[index]}"
done