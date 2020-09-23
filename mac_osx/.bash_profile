# anaconda
# set anaconda python 3 as default python 
export PATH=~/anaconda3/bin:$PATH
# https://stackoverflow.com/questions/22773432/mac-using-default-python-despite-anaconda-install
export PATH="$HOME/anaconda/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"

# java8 
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# RabbitMQ
export PATH=$PATH:/usr/local/sbin

# Gloud 
# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/yennanliu/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/yennanliu/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/yennanliu/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/yennanliu/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# maven
export M2_HOME=/Users/yennanliu/apache-maven-3.6.3
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1048m -Xms256m -XX:MaxPermSize=312M"
export PATH=$M2:$PATH
#export M3_HOME=/Users/yennanliu/maven/apache-maven-3.6.0
#export PATH=$M3_HOME/bin:$PATH

# spark 
export SPARK_HOME=/Users/$USER/spark
export PATH=$SPARK_HOME/bin:$PATH

# elsatic search
export ES_HOME=/usr/local/bin/elasticsearch
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH
