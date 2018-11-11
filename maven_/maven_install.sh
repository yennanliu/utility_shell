#!/bin/sh

########################################################## 

# DOWNLOAD maven for MAC OSX

# http://maven.apache.org/download.cgi
# https://juejin.im/post/5b0c08b16fb9a009d16211c8
# https://blog.csdn.net/u011619283/article/details/56671530

########################################################## 


# Step 1)
# download file :   apache-maven-3.3.9-bin.tar.gz  (http://maven.apache.org/download.cgi)
cd 
wget --quiet http://apache.mirror.anlx.net/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P  Downloads 

# step 2)
# unzip to user defined location (/Users/yennanliu/maven/apache-maven-3.6.0 for example)
cd 
mkdir maven || (echo 'maven file already exist, delete it and make again..'  &&  rm -fr maven  &&  mkdir maven) 
my_route="/Users/$USER/maven/"
tar -xzf $PWD/Downloads/apache-maven-3.6.0-bin.tar.gz  -C maven

# step 3) 
# edit env variables 
# nano .bash_profile
# add these line in .bash_profile
# https://superuser.com/questions/678113/how-to-add-a-line-to-bash-profile


#-----------------------------
# add Maven env variables 
#export M3_HOME=/usr/local/maven/maven3.3.9
#export PATH=$M3_HOME/bin:$PATH
#-----------------------------
sudo echo "export M3_HOME=/Users/$USER/maven/apache-maven-3.6.0" >> .bash_profile
sudo echo "export PATH=$M3_HOME/bin:$PATH" >> .bash_profile


# step 4) make changes in  step 3) work 
source .bash_profile

# step 5) check if Maven install success
echo $M3_HOME
echo $PATH
mvn -version





