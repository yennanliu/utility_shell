#!/bin/sh


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
...            -> image layer 
..
..

---------------


3) Registry : github for docker (check Docker Hub)



"""
COMMENT1




# 1) LAUNCH --------------------------
# launch docker 
docker 


# 2) LIST/SHOW --------------------------
# To show only running containers use the given command:
docker ps
#To show all containers use the given command:
docker ps -a
# List all CONTAINERS  (only IDs)
docker ps -aq
# List all IMAGES 
docker images 


# 3) RUN 
# run container from image 
docker run   yennanliu/mac_ds_ml_env:v1
# run image 
docker run -it  yennanliu/mac_ds_ml_env:v1


# 3) STOP --------------------------
# Stop all running containers
# https://medium.com/the-code-review/top-10-docker-commands-you-cant-live-without-54fb6377f481
docker stop -f $(docker ps -aq)
#docker stop $(docker ps -a -q)


# 4) REMOVE --------------------------
# Remove all containers
docker rm -f $(docker ps -aq)
# Remove all images
docker rmi -f $(docker images -q)
# remove all containers in docker
docker rm -f $(docker ps -a -q)
# remove all images in docker
docker rmi -f $(docker images -q -a)


# 5) OTHERS 
# search docker online 
docker search spark 






