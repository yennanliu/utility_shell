#!/bin/sh



# get list of chrome relative 
ps -ef | grep chrome 
echo '=============='

# get chrome pid and running time 
# http://www.binarytides.com/linux-ps-command/

# explain of ps output 
# https://kb.iu.edu/d/afnv
# https://www.ibm.com/support/knowledgecenter/en/ssw_aix_61/com.ibm.aix.cmds4/ps.htm
# TIME :  The total runtime for the process. The time is displayed in the format of mm:ss or mmmm:ss if the runtime reaches 100 minutes, which is different from the displayed format if you use the -o time flag.
# STIME : Time when the process started


# dispaly process 
ps -C chrome 
echo '=============='
# Display process hierarchy in a tree style
ps -f --forest -C chrome
echo '=============='
# Display elapsed time 
# etime is the elapsed time since the process was started,
# in the form dd-hh:mm:ss. 
# dd is the number of days; 
# hh, the number of hours; 
# mm, the number of minutes; 
# ss, the number of seconds.

ps -eo pid,cmd,etime | grep chrome/chrome 





