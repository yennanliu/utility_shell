export PATH="$HOME/bin:$PATH"

# set anaconda python 3 as default python 
export PATH=~/anaconda3/bin:$PATH

# java_home
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# hadoop_home
export HADOOP_HOME=hadoop

# hadoop config
export HADOOP_MAPRED_HOME=$HADOOP_HOME 
export HADOOP_COMMON_HOME=$HADOOP_HOME 
export HADOOP_HDFS_HOME=$HADOOP_HOME 
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native export
PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin



# added by travis gem
[ -f /Users/yennanliu/.travis/travis.sh ] && source /Users/yennanliu/.travis/travis.sh
export PATH="$HOME/bin:$PATH"

# set anaconda python 3 as default python 
export PATH=~/anaconda3/bin:$PATH

# java_home
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# hadoop
export HADOOP_HOME=hadoop
export HADOOP_MAPRED_HOME=$HADOOP_HOME 
export HADOOP_COMMON_HOME=$HADOOP_HOME 
export HADOOP_HDFS_HOME=$HADOOP_HOME 
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native export
PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

# hive
export HIVE_HOME=/usr/local/Cellar/hive
export PATH=$PATH:$HIVE_HOME/3.1.2/bin
export CLASSPATH=$CLASSPATH:/usr/local/Hadoop/lib/*:.
export CLASSPATH=$CLASSPATH:/usr/local/hive/lib/*:.


# added by travis gem
[ -f /Users/yennanliu/.travis/travis.sh ] && source /Users/yennanliu/.travis/travis.sh
