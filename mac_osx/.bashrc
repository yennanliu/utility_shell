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
