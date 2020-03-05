#!/bin/sh


# 1) declare env var
export HADOOP_VERSION=hadoop-2.7.3

# 2) prerequisite
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
#sudo apt-get install oracle-java8-installer
#sudo apt-get install default-jdk -y
sudo apt install openjdk-8-jre-headless -y 

# 3) install hadoop 
mkdir hadoopdata
wget https://archive.apache.org/dist/hadoop/core/${HADOOP_VERSION}/${HADOOP_VERSION}.tar.gz
sudo tar xzf ${HADOOP_VERSION}.tar.gz 
sudo cp ${HADOOP_VERSION} /usr/local/hadoop
### grant hadoop user to access the file  ####
sudo chown -R ubuntu /home/ubuntu/${HADOOP_VERSION}/ 

# 4) update ~/.bashrc
export HADOOP_VERSION=hadoop-2.7.3
export HADOOP_HOME=/home/ubuntu/${HADOOP_VERSION}
export HADOOP_COMMON_LIB_NATIVE_DIR=${HADOOP_HOME}/lib/native
export HADOOP_OPTS="-Djava.library.path=${HADOOP_HOME}/lib"
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
#PATH=$PATH:$JAVA_HOME/bin:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin

echo "export HADOOP_VERSION=hadoop-2.7.3"  >> ~/.bashrc
echo "export HADOOP_HOME=/home/ubuntu/${HADOOP_VERSION}"  >> ~/.bashrc
echo "export HADOOP_COMMON_LIB_NATIVE_DIR=${HADOOP_HOME}/lib/native"  >> ~/.bashrc
echo "export HADOOP_OPTS='"-Djava.library.path=$HADOOP_HOME/lib"'" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle"  >> ~/.bashrc
echo "PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin"  >> ~/.bashrc

#source ~/.bashrc
. ~/.bashrc

# 5) Setting hadoop environment for password less ssh access
#ssh-keygen -t rsa -P ''  <<< y
#cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys 
# ssh-keygen -t rsa -N ''  <<< y
# cat ~/.ssh/id_rsa >> $HOME/.ssh/authorized_keys 
ssh-keygen -b 2048 -t rsa -f /tmp/sshkey -q -N ""
cat /tmp/sshkey >> $HOME/.ssh/authorized_keys 


# 6) update sshd_config 
# /etc/ssh/sshd_config
# PasswordAuthentication yes

# 7) restart bash
sudo service ssh restart
ssh localhost -y
exit

# 8) git clone code 
git clone https://github.com/yennanliu/HadoopHelloWorld.git

# 8) update core-site.xml
sudo cp -f HadoopHelloWorld/hadoop-ec2/core-site.xml /home/ubuntu/${HADOOP_VERSION}/etc/hadoop/core-site.xml

# 9) update hadoop-env.sh
sudo cp -f HadoopHelloWorld/hadoop-ec2/hadoop-env.sh /home/ubuntu/${HADOOP_VERSION}/etc/hadoop/hadoop-env.sh

# 10) update yarn-site.xml
sudo cp -f HadoopHelloWorld/hadoop-ec2/yarn-site.xml /home/ubuntu/${HADOOP_VERSION}/etc/hadoop/yarn-site.xml

# 11) update hdfs-site.xml
sudo cp -f HadoopHelloWorld/hadoop-ec2/hdfs-site.xml /home/ubuntu/${HADOOP_VERSION}/etc/hadoop/hdfs-site.xml

# 12) update mapred-site.xml
sudo cp -f HadoopHelloWorld/hadoop-ec2/mapred-site.xml /home/ubuntu/${HADOOP_VERSION}/etc/hadoop/mapred-site.xml

# 13) format HDFS (init)
hdfs namenode -format

# 14) start dfs, yarn
bash /home/ubuntu/${HADOOP_VERSION}/sbin/start-dfs.sh  <<< y
bash /home/ubuntu/${HADOOP_VERSION}/sbin/start-yarn.sh <<< y 

# 15) check hadoop processes /daemons running on hadoop
sudo apt install openjdk-8-jdk-headless 
jps 

# 16) stop dfs, yarn
bash /home/ubuntu/${HADOOP_VERSION}/sbin/stop-dfs.sh
bash /home/ubuntu/${HADOOP_VERSION}/sbin/stop-yarn.sh