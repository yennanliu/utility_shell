# ref : https://docs.docker.com/engine/install/centos/
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
