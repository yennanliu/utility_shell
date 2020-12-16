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
