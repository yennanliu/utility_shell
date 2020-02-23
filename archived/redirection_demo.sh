#!/bin/sh

# https://devhints.io/bash


: '
### Redirection

python hello.py > output.txt                 # stdout to (file)
python hello.py >> output.txt                # stdout to (file), append
python hello.py 2> error.log                 # stderr to (file)
python hello.py 2>&1                         # stderr to stdout
python hello.py 2>/dev/null                  # stderr to (null)
python hello.py &>/dev/null                  # stdout and stderr to (null)
python hello.py >> output.txt 2>&1           # stderr to stdout to file, append 
'


# -----------------------------------
echo 'DEMO 1)'

bash read_line_demo.sh >> redirection_output.txt


# -----------------------------------
echo 'DEMO 2)'

bash read_line_demo.sh 2> redirection_output.log


# -----------------------------------
echo 'DEMO 3)'

echo hello > redirection_hello.txt
cat redirection_hello.txt



