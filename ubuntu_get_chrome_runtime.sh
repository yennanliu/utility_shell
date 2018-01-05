#!/bin/sh



# get list of chrome relative 
ps -ef | grep chrome 


# get chrome pid and running time 
# http://www.binarytides.com/linux-ps-command/
# dispaly process 
#ps -C chrome 
# Display process hierarchy in a tree style
ps -f --forest -C chrome