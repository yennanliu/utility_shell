# 0) brew install zk & zk basic cmd
# https://segmentfault.com/a/1190000022287477

# 1) kill/run zk via brew
brew services start zookeeper
brew services stop zookeeper

# 2) ZK CLI
zkCli
ls /
ls /services
# get node info
# exmaple :
# get /services/cloud-provider-payment/95644d59-29d5-47a3-86ae-fda24689cb8b


# 2') ZK CLI example
# https://youtu.be/eKnWj_rDQO0?t=553
# step 1) /.zkServer.sh start
# step 2) /.zkCli.sh
# step 3) (inside ZK) ls /
# step 4) (inside ZK) get /zookeeper
