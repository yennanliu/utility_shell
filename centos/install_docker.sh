###############################
# INSTALL DOCKER ON CENTOS 7.6
###############################

# ref
# 0) https://blog.gtwang.org/linux/centos-linux-7-install-docker-tutorial/
# 1) sudo yum install docker-ce-17.03.1.ce-1.el7.centos docker-ce-cli-17.03.1.ce-1.el7.centos containerd.io
# 2) https://linoxide.com/how-to-install-docker-on-centos/
# 3) https://qiita.com/smallpalace/items/57bf018909644e7c3e70
# 4) install docker on cent OS 7.6 : https://manjaro.site/how-to-install-docker-on-centos-7-6/

# V1 ------------------------------
# install docker command  (dev)
sudo yum install docker-ce-3:19.03.4-3.el7.x86_64  docker-ce-3:19.03.4-3.el7.x86_64  containerd.io


# V2 ------------------------------
# set up proxy if needed
yum install containerd.io
yum install docker-ce-3:19.03.4-3.el7.x86_64

systemctl start docker
systemctl enable docker

# if there is subnet issue, kindly run below ( change docker0 interface default ip range from  172.17.0.0/16 to 172.32.0.0/16
ip addr add 172.32.0.0/16 dev docker0
ip link set dev docker0 up
ip addr show docker0


# 1) Manage Docker as a non-root user
# https://docs.docker.com/engine/install/linux-postinstall/#:~:text=Manage%20Docker%20as%20a%20non%2Droot%20user&text=By%20default%20that%20Unix%20socket,and%20add%20users%20to%20it.
# (as root user)
sudo groupadd docker
sudo usermod -aG docker <user_name>


# 2) clean docker, meta, relative files:
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
                  
sudo yum remove docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
