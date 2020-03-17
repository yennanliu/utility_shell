#!/bin/sh
# https://www.elastic.co/guide/en/kibana/current/brew.html

#################################################################
# SCRIPT HELP INSTALL kibana  
#################################################################

brew tap elastic/tap
brew install elastic/tap/kibana-full

# get install info.
brew info kibana

# config file 

# 1) home
# /usr/local/var/homebrew/linked/kibana-full

# 2) bin 
# /usr/local/var/homebrew/linked/kibana-full/bin

# 3) config
# /usr/local/etc/kibana

# 4) data 
# /usr/local/var/lib/kibana

# 5) log
# /usr/local/var/log/kibana

# 6) plugin
# /usr/local/var/homebrew/linked/kibana-full/plugins

