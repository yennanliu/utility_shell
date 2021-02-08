### 1) install docker-compose for centOS

# sudo as root user
# https://unihost.com/help/how-to-install-and-use-docker-compose-on-centos-8/#:~:text=Docker%20Compose%20is%20not%20available,Install%20the%20curl%20command.&text=Download%20the%20latest%20version%20of%20Docker%20Compose.
curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# give access to users
# https://qiita.com/yoshiyasu1111/items/59373d6756894ebf1df6
chmod +x /usr/local/bin/docker-compose
# try 
docker-compose
