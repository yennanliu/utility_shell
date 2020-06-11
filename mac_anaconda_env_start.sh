#!/bin/bash
"""
After install anaconda (python 3)
Using commands below set anaconda python 3 as default python 

# https://stackoverflow.com/questions/18675907/how-to-run-conda

# for anaconda 3 :
$export PATH=~/anaconda3/bin:$PATH

# or can modify bash env setting directly 
$nano  .bash_profile
# add following command  to .bash_profile and save 
export PATH=~/anaconda3/bin:$PATH

"""

# export PATH 
# https://www.cyberciti.biz/faq/unix-linux-adding-path/
echo 'export PATH=~/anaconda3/bin:$PATH'  >> ~/.bash_profile

# check python version 
echo 'test python version :'

python --version
which python 
