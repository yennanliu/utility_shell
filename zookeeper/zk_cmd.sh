# 1) kill/run zk via brew
brew services start zookeeper
brew services stop zookeeper

# 2) ZK CLI example
# https://youtu.be/eKnWj_rDQO0?t=553
# step 1) /.zkServer.sh start
# step 2) /.zkCli.sh
# step 3) (inside ZK) ls /
# step 4) (inside ZK) get /zookeeper
