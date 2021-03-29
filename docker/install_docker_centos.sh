# ref1 : https://docs.docker.com/engine/install/centos/
# ref2 : https://phoenixnap.com/kb/how-to-install-docker-centos-7
# login as root user

# uninstall old versions
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# install Docker Engine
#sudo yum install docker-ce docker-ce-cli containerd.io --skip-broken

#VERSION_STRING=18.09.1
VERSION_STRING=17.12.1.ce-1.el7.centos
sudo yum install docker-ce-$VERSION_STRING docker-ce-cli-$VERSION_STRING containerd.io

# start docker
sudo systemctl start docker


# remove installed docker engine
sudo yum remove docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
# https://blog.csdn.net/weimenglala/article/details/102736921
# check to-delete list
yum list installed | grep docker
yum -y remove docker.x86_64
yum -y remove docker-client.x86_64
yum -y remove docker-common.x86_64
