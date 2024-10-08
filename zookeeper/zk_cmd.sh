#---------------------------------
# ZK command
#---------------------------------


# 0) brew install zk & zk basic cmd
# https://segmentfault.com/a/1190000022287477

# 1) kill/run zk via brew
brew services start zookeeper
brew services stop zookeeper

# 2) ZK CLI

# https://husterxsp.github.io/2018/10/08/zookeeper%E5%AE%89%E8%A3%85/


# file path
# /usr/local/etc/zookeeper

cd /usr/local/etc/zookeeper

zkCli
ls /
ls /services


# 2') ZK CLI example
# https://youtu.be/eKnWj_rDQO0?t=553
# step 1) /.zkServer.sh start
# step 2) /.zkCli.sh
# step 3) (inside ZK) ls /
# step 4) (inside ZK) get /zookeeper
