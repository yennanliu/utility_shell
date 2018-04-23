 #!/bin/sh


<<COMMENT1
# check if file/directory exist  in Unix 
# https://unix.stackexchange.com/questions/383773/bash-script-test-whether-file-exists
"""
file='install_pyspark.sh'
 if [[ -f "$file" ]]; then 
    echo "the file exists."
else
    echo "the file does not exist."
fi
"""
COMMENT1

function file_exist(){
file='datasets/ml-latest'
#file='launch_env.sh'
echo $file

 if [[ -d "$file" ]]; then 
    echo "the file exists."
else
    echo "the file does not exist."
fi }


file_exist


