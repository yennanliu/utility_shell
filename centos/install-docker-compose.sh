# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-centos-7

# plz install docker first, and as root user
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# check install
docker-compose --version
