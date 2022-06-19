#!/bin/sh


# a shell start local dev env  

 
function run_jupyter_notebook () {
echo "run notebook ..."
# you can export CREDENTIALS, environmenr variables .. via command : 
# export <your_env_variable>  
source activate g_dash ; export PYTHONPATH=$PYTHONPATH:/anaconda/envs/g_dash/lib/python3.4  ; cd ~ ;   jupyter notebook
exit 0 ;
}


function show_virtual_envs () {
 echo "list all dev envs "
 conda env list 
 exit 0 ;
}


while true  
do
clear
echo "Choose an action: a, b or c  "
echo "a: run jupyter notebook"
echo "b: show virtual dev envs"
echo "c: Exit"
read -sn1
#REPLY=$(to_upper "$REPLY")
case "$REPLY"  in
	a) run_jupyter_notebook;; 
	b) show_virtual_envs ;;
	c) exit 0 ;;
esac 

read -n1 -p "Press any key to continue"
done

