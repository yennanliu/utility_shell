#!/bin/sh

# https://medium.com/beeranddiapers/installing-hadoop-on-mac-a9a3649dbc4d
# https://www.quickprogrammingtips.com/big-data/how-to-install-hadoop-on-mac-os-x-el-capitan.html

# STEP 1) install hadoop
brew install hadoop

# STEP 2) Configure SSH
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

# STEP 3) modfify hadoop-env.sh
# nano /Users/$USER/hadoop/etc/hadoop/hadoop-env.sh
# export JAVA_HOME=/usr/bin/java

# STEP 4) modfify core-site.xml
# nano /Users/$USER/hadoop/etc/hadoop/core-site.xml
# <configuration>
#     <property>
#         <name>fs.defaultFS</name>
#         <value>hdfs://localhost:9000</value>
#     </property>
# </configuration>

# STEP 5) modfify hdfs-site.xml 
# nano /Users/$USER/hadoop/etc/hadoop/hdfs-site.xml
# <configuration>
#     <property>
#         <name>dfs.replication</name>
#         <value>1</value>
#     </property>
# </configuration>

# STEP 6) modfify mapred-site.xml
# nano /Users/$USER/hadoop/etc/hadoop/mapred-site.xml
# <configuration>
#     <property>
#         <name>mapreduce.framework.name</name>
#         <value>yarn</value>
#     </property>
# </configuration>

# STEP 7) modfify yarn-site.xml
# nano /Users/$USER/hadoop/etc/hadoop/mapred-site.xml
# <configuration>
#     <property>
#         <name>yarn.nodemanager.aux-services</name>
#         <value>mapreduce_shuffle</value>
#     </property>
#     <property>
#         <name>yarn.nodemanager.env-whitelist</name>
#         <value>JAVA_HOME, HADOOP_COMMON_HOME, HADOOP_HDFS_HOME, HADOOP_CONF_DIR, CLASSPATH_PREPEND_DISTCACHE, HADOOP_YARN_HOME, HADOOP_MAPRED_HOME
#         </value>
#     </property>
#     <property>
#         <name>yarn.nodemanager.disk-health-checker.max-disk-utilization-per-disk-percentage
#         </name>
#         <value>98.5</value>
#     </property>
# </configuration>
