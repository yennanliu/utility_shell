#!/bin/sh




# ref 
# https://askubuntu.com/questions/3375/how-to-change-time-zone-settings-from-the-command-line


# get current time
date 

# list all timezone 
timedatectl list-timezones

# modify timestamp to BST 
sudo timedatectl set-timezone BST