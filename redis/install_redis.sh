#!/bin/sh
#https://redis.io/topics/quickstart

# STEP 1) download redis 
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
make test

# STEP 2) copy files
cd ~ && redis-stable
sudo cp src/redis-server /usr/local/bin/
sudo cp src/redis-cli /usr/local/bin/