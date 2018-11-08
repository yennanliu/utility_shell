#!/bin/sh




# check airflow behind docker log 
# https://www.astronomer.io/guides/astro-cli/

docker logs $(docker ps | grep scheduler | awk '{print $1}')