#!/bin/sh
# https://github.com/twtrubiks/docker-tutorial
#################################################################
# DOCKER OP USEFUL COMMANDS  
#################################################################
<<COMMENT1
"""
# https://github.com/twtrubiks/docker-tutorial

### CONCEPT ###
1) image  :  like a VM Guest OS, read only (R\O), a image can make multiple containers
2) container : made by image, can be launch/stop/remove/split. read and write (R\W)

e.g. 
---------------
container later   -> container layer 
---------------
91e54d1179
d7405fb234
...            -> image layers 
..
..
---------------


3) Registry : github for docker (check Docker Hub)

"""
COMMENT1

# 0) Find machine internal ip
# https://apple.stackexchange.com/questions/20547/how-do-i-find-my-ip-address-from-the-command-line
ipconfig getifaddr en0

# 1) LAUNCH --------------------------
# launch docker 
docker 


# 1) docker tag 
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]


# 2) LIST/SHOW --------------------------
# To show only running containers use the given command:
docker ps
#To show all containers use the given command:
docker ps -a
# List all CONTAINERS  (only IDs)
docker ps -aq
# List all IMAGES 
docker images 


# 3) show docker layer 
docker history [OPTIONS] IMAGE


# 4) RUN 
# run via image 
docker run -it  <Image ID> bash


# run via container
docker exec -it  <Container ID> bash


# run via container (as root)
docker exec -u root -it <Container ID> bash 


# 5) CHECK LOG 
docker logs [OPTIONS] CONTAINER

# 5)' CHECK live tail LOG
# https://stackoverflow.com/questions/52119832/how-to-tail-a-docker-log-from-the-current-position-in-the-log-without-seeing-the
docker logs -f --tail 10  <ur_docker_instance_id>

# 6) SHOW RESOURCE USING 
docker stats [OPTIONS] [CONTAINER...]


# 7) PAUSE IN-CONTAINER ALL PROCESSES
docker pause CONTAINER [CONTAINER...]
# 7') RESTART PAUSE (IN-CONTAINER ) PROCESSES 
docker unpause CONTAINER [CONTAINER...]


# 8) STOP --------------------------
# Stop all running containers
# https://medium.com/the-code-review/top-10-docker-commands-you-cant-live-without-54fb6377f481
docker stop -f $(docker ps -aq)
#docker stop $(docker ps -a -q)


# 9) REMOVE --------------------------
# Remove all containers
docker rm -f $(docker ps -aq)
# Remove all images
docker rmi -f $(docker images -q)
# remove all containers in docker
docker rm -f $(docker ps -a -q)
# remove all images in docker
docker rmi -f $(docker images -q -a)


# 10) OTHERS 
# search docker online 
docker search spark

# 11) Clean docker cache
# https://forums.docker.com/t/where-are-images-stored-on-mac-os-x/17165/7
# ~/Library/Containers/com.docker.docker/Data

# 13) connect to local machine from docker instance
# examples 
# root@fb34d5dc1b8e:/opt/airflow# ssh yennan.liu@192.168.0.178
# Password:
# Last login: Thu Jan 28 16:57:06 2021
# (base) yenliu.liu@SOMEPC30008 ~ %
# (base) yenliu.liu@SOMEPC30008 ~ %
# (base) yenliu.liu@SOMEPC30008 ~ %
# (base) yenliu.liu@SOMEPC30008 ~ % Connection to 192.168.0.178 closed by remote host.
# check local machine inernal ip:
ipconfig getifaddr en0
# ssh to local machine
ssh <local_user>@<local_ip>
# input password
# enjoy!

# 11) get container id (airflow_jpw_worker_1 as example here)
containers_id="`docker ps -a | grep airflow_jpw_worker_1 | awk '{print $1}'`"
echo $containers_id

# 12) outside container and run command on it (container), (airflow_jpw_worker_1 as example here)
containers_id="`docker ps -a | grep airflow_jpw_worker_1 | awk '{print $1}'`"
echo $containers_id
docker exec -it $containers_id /bin/sh -c "pwd && ls"
docker exec -it $containers_id /bin/sh -c "python"
