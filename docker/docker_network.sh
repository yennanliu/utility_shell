#!/bin/sh
# https://github.com/twtrubiks/docker-tutorial
# https://docs.docker.com/engine/reference/commandline/network_disconnect/


#################################################################
# DOCKER NETWORK COMMANDS  
#################################################################


<<COMMENT1
"""

# NETWORK TYPE IN DOCKER 

1) Bridge (default)
2) Host 
3) None 


"""
COMMENT1



# 1) CHECK CURRENT DOCKER NETWORK LIST 
docker network ls [OPTIONS]

# 1' ) SET UP NETWORK example 
docker run -it --name busybox --rm --network=host busybox

# 2) create network 
docker network create [OPTIONS] NETWORK

# 3) remove network 
docker network rm NETWORK [NETWORK...]
# 3') remove all  non-using network 
docker network prune [OPTIONS]

# 4) check network detail 
docker network inspect [OPTIONS] NETWORK [NETWORK...]

# 5) connect container to network 
docker network connect [OPTIONS] NETWORK CONTAINER

# 6) disconnect container network 
docker network disconnect [OPTIONS] NETWORK CONTAINER


# 7) User-defined networks
# dev 




