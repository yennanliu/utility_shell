#!/bin/sh


#################################################################
# CHANGE MAC OSX DEFAULT  BASH <----> ZSH 
#################################################################



# STEP 1) 
# http://osxdaily.com/2012/03/21/change-shell-mac-os-x/


# STEP 2) CHANGE DEFAULR LOGIN SHELL 
chsh -s /bin/zsh

# STEP 3) VALID DEFIULT SHELL 
echo $SHELL        