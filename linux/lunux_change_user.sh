#!/bin/sh


# ref 
# https://www.lifewire.com/switch-user-su-command-3887179


# 1) cheange to root 
sudo su 

# 2) How To Switch To Another User And Adopt Their Environment

# set up passwd for  <to_switch_user_id>
passwd <to_switch_user_id>
su <to_switch_user_id>

# 3) now should in the linux system but with new userid <to_switch_user_id>