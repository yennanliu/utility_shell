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
sudo yum install docker-ce docker-ce-cli containerd.io --skip-broken
