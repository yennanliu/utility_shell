#!/bin/sh


# launch docker 
docker 

# To show only running containers use the given command:
docker ps


#To show all containers use the given command:
docker ps -a


# List all containers (only IDs)
docker ps -aq

# Stop all running containers
docker stop $(docker ps -aq)
# Remove all containers
docker rm $(docker ps -aq)
# Remove all images
docker rmi $(docker images -q)

