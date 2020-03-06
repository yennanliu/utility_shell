# https://qiita.com/giwa/items/dabf0bb21ae242532423
# https://luckymrwang.github.io/2018/03/14/Install-hive-on-Mac-with-Homebrew/
# https://www.tutorialspoint.com/hive/hive_installation.htm

# STEP 1) INSTALL JAVA
java -version 

# STEP 2) INSTALL HADOOP
hadoop version

# STEP 3) SET UP HADOOP 
# plz follow https://github.com/yennanliu/utility_shell/blob/master/hadoop/install_hadoop_mac.sh

# STEP 4) VERRIGY HADOOP INSTALLATION 
hdfs namenode -format
sbin/start-dfs.sh
sbin/start-yarn.sh

# STEP 4)  Downloading Hive
brew install hive


# STEP 5) CONFIG HIVE
# https://cwiki.apache.org/confluence/display/Hive/AdminManual+Configuration#AdminManualConfiguration-hive-site.xmlandhive-default.xml.template
# https://stackoverflow.com/questions/27099898/java-net-urisyntaxexception-when-starting-hive

# TODO 
# TEST AGAIN with https://www.datageekinme.com/setup/setting-up-my-mac-hive/
