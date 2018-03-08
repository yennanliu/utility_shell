#!/bin/sh

# get chrome pid and running time 
# http://www.binarytides.com/linux-ps-command/
#
# explain of ps output 
# https://kb.iu.edu/d/afnv
# https://www.computerhope.com/unix/ups.htm
# https://www.ibm.com/support/knowledgecenter/en/ssw_aix_61/com.ibm.aix.cmds4/ps.htm
### http://linux.vbird.org/linux_basic/0440processcontrol/0440processcontrol-fc4.php#process_1
# TIME :  The total runtime for the process. The time is displayed in the format of mm:ss or mmmm:ss if the runtime reaches 100 minutes, which is different from the displayed format if you use the -o time flag.
# STIME : Time when the process started



# get list of chrome relative 
function get_process_chrome (){
ps -ef | grep chrome
 }

# dispaly process 
#ps -C chrome 
#echo '=============='

# Display process hierarchy in a tree style
function get_hierarchy_process_chrome() {
ps -f --forest -C chrome
 }

# Display elapsed time 
# etime is the elapsed time since the process was started,
# in the form dd-hh:mm:ss. 
# dd is the number of days; 
# hh, the number of hours; 
# mm, the number of minutes; 
# ss, the number of seconds.
#echo 'show process with elapsed time...'

function get_process_chrome_elapsed_time(){
ps -eo pid,cmd,etime | grep chrome/chrome 
}


current_date_time_=`date "+%Y-%m-%d %H:%M:%S"`
echo 'current_date_time_ : ' $current_date_time_;


echo ''
echo 'GET list of chrome relative ... '
echo ''
get_process_chrome 
echo '=============='
echo 'SHOW running process hierarchy ...'
echo ''
get_hierarchy_process_chrome
echo '=============='
echo 'SHOW running process with elapsed time ...'
echo ''
get_process_chrome_elapsed_time



