#--------------------------------
# METHOD 1)
#--------------------------------
# https://stackoverflow.com/questions/10586153/how-to-split-a-string-into-an-array-in-bash

# demo 1-1
myarray="Paris, France, Europe"
echo $myarray
IFS=', ' read -r -a array <<< "$myarray"
echo "${array[0]}"
echo "${array[1]}"
echo "${array[2]}"

# demo 1-2
yyyymmdd="2021-01-01"
echo $yyyymmdd
IFS='- ' read -r -a array <<< "$yyyymmdd"

echo "${array[0]}"
echo "${array[1]}"
echo "${array[2]}"
