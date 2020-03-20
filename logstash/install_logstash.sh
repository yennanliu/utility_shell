#!/bin/sh
# https://www.elastic.co/downloads/logstash

#################################################################
# SCRIPT HELP INSTALL logstach  
#################################################################

# install logstach  7.6.1 (here I install kibana 7.6.1)  -> THIS VERSION DOESNT HAVE X-PACK ISSUE, WORKS OK
# https://www.elastic.co/downloads/logstash
# file location 
# /Users/yennanliu/logstash-7.6.1$

# 1) Prepare a logstash.conf config file for init launch 
nano logstash.conf 

# 2) config files 
# /Users/$USER/logstash-7.6.1/config
cd logstash-7.6.1/config
nano logstash.yml  

# 3) run logstach
cd logstash-7.6.1
bin/logstash -f logstash.conf
