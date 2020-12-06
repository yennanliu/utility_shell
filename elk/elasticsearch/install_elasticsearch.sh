#!/bin/sh
# https://chartio.com/resources/tutorials/how-to-install-elasticsearch-on-mac-os-x/
#################################################################
# SCRIPT HELP INSTALL elasticsearch  
#################################################################

# METHOD 1 ) : download via UI 
# (should install elasticsearch 7.6.1) -> THIS VERSION DOESNT HAVE X-PACK ISSUE, WORKS OK
# https://www.elastic.co/downloads/elasticsearch
# file location : 
# /Users/yennanliu/elasticsearch-7.6.1

# METHOD 1') : via brew 
# (should install elasticsearch 6.8.7)
# brew update && brew install elasticsearch 
# get install info.
#brew info elasticsearch

# METHOD 2 ) install manually 
# STEP 1) install Java : http://www.oracle.com/technetwork/java/javase/downloads/index.html
# STEP 2) get elasticsearch  : https://www.elastic.co/downloads/elasticsearch
# STEP 3)unzip the file and run the install script  :  tar -xvf elasticsearch-2.3.1.tar.gz 
# STEP 4) set up env variables  : sudo nano ~/.bash_profile 
# export ES_HOME=~/apps/elasticsearch/elasticsearch-2.3.1
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_77/Contents/Home
# export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH
export ES_HOME=/usr/local/bin/elasticsearch
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH

# RUN elasticsearch
cd elasticsearch-7.6.1
bin/elasticsearch
