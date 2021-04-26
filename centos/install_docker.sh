# ref
# 0) https://blog.gtwang.org/linux/centos-linux-7-install-docker-tutorial/
# 1) sudo yum install docker-ce-17.03.1.ce-1.el7.centos docker-ce-cli-17.03.1.ce-1.el7.centos containerd.io
# 2) https://linoxide.com/how-to-install-docker-on-centos/
# 3) https://qiita.com/smallpalace/items/57bf018909644e7c3e70
# 4) install docker on cent OS 7.6 : https://manjaro.site/how-to-install-docker-on-centos-7-6/

# install docker command  (dev)
sudo yum install docker-ce-3:19.03.4-3.el7.x86_64  docker-ce-3:19.03.4-3.el7.x86_64  containerd.io


# extra : clean docker, meta, relative files:
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
