#!/bin/sh



# 1) LAUNCH --------------------------
# launch docker 
docker 


# 2) LIST/SHOW --------------------------

# To show only running containers use the given command:
docker ps

#To show all containers use the given command:
docker ps -a

# List all containers (only IDs)
docker ps -aq


# 3) STOP --------------------------

# Stop all running containers
docker stop $(docker ps -aq)


# 4) REMOVE --------------------------

# Remove all containers
docker rm $(docker ps -aq)
# Remove all images
docker rmi $(docker images -q)
# remove all containers in docker
docker rm $(docker ps -a -q)
# remove all images in docker
docker rmi $(docker images -q -a)



