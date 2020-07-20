#!/bin/sh
# step by step install docker on ubuntu 18-04
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

# install docker-compose
sudo apt install docker-compose

# add docker-compose to docker user group
# https://oranwind.org/-solution-qi-dong-docker-compose-fa-sheng-error-couldnt-connect-to-docker-daemon-at-httpdockerlocalunixsocket-is-it-running-cuo-wu/ 
sudo gpasswd -a ${USER} docker
sudo su
su elkuser

# run the docker-compose up
docker-compose up