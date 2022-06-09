# Install Redis (Docker)
# https://hub.docker.com/_/redis
# https://www.youtube.com/watch?v=c3lLy3KCjYk&list=PLmOn9nNkQxJESDPnrV6v_aiFgsehwLgku&index=10
docker pull redis

# check pull images
docker images

# run Redis (Docker)
# -d : run in background
# -p : expose docker internal 6379 port to local machine's 6379 port 
# --name : name docker instance
# name of iamge we want to run
docker run -d -p 6379:6379 --name myredis redis

docker ps -a