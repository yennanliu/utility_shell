#!/bin/sh
# https://www.elastic.co/guide/en/kibana/current/brew.html

#################################################################
# SCRIPT HELP INSTALL kibana  
#################################################################

# install kibana  7.6.1 (here I install kibana 7.6.1)  -> THIS VERSION DOESNT HAVE X-PACK ISSUE, WORKS OK
# https://www.elastic.co/downloads/kibana-oss
# file location 
# /Users/yennanliu/kibana-7.6.1-darwin-x86_64

# install kibana 6.8.7 (here I install kibana 6.8.7, since my elasticsearch is 6.8.7 as well)
# https://www.elastic.co/guide/en/kibana/6.8/targz.html
# https://www.elastic.co/downloads/past-releases/kibana-6-8-7
# curl -O https://artifacts.elastic.co/downloads/kibana/kibana-6.8.7-darwin-x86_64.tar.gz
# shasum -a 512 kibana-6.8.7-darwin-x86_64.tar.gz 
# tar -xzf kibana-6.8.7-darwin-x86_64.tar.gz
# cd kibana-6.8.7-darwin-x86_64/ 

# run kibana
cd kibana-7.6.1-darwin-x86_64
./bin/kibana 

# get install info.
brew info kibana

# config file 

# 1) home
# /usr/local/var/homebrew/linked/kibana-full

# 2) bin 
# /usr/local/var/homebrew/linked/kibana-full/bin

# 3) config
# /usr/local/etc/kibana/kibana.yml
# kibana-6.8.7-darwin-x86_64/config/kibana.yml

# 4) data 
# /usr/local/var/lib/kibana

# 5) log
# /usr/local/var/log/kibana

# 6) plugin
# /usr/local/var/homebrew/linked/kibana-full/plugins

