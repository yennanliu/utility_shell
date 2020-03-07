
# install git
sudo yum install git

# install sbt 
# https://medium.com/@tedherman/compile-scala-on-emr-cb77610559f0
wget https://github.com/sbt/sbt/releases/download/v0.13.15/sbt-0.13.15.tgz
tar xf sbt-0.13.15.tgz
sudo mv sbt /opt
export PATH=$PATH:/opt/sbt/bin
sbt