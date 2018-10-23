#!/bin/sh

# credit 
# https://github.com/CoorpAcademy/docker-pyspark/blob/master/README.md




# pull the docker image 
docker pull coorpacademy/docker-pyspark:latest

# run the docker image 
docker run -it coorpacademy/docker-pyspark:latest /bin/bash

# start pyspark 
./bin/pyspark  # open an interactive python shell with SparkContext as sc


