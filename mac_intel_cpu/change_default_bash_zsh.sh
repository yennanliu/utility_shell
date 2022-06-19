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

# STEP 4) MODIFY ZSH PROFILE FULE 
# ref bash profile : .bash_profile  
nano .zshrc 

# STEP 5) activate zsh profile setting 
source .zshrc

# STEP 6) CHECK NEW TERMIANL layout (terminate terminal, and open the APP again)