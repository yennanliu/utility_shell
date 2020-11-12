#!/bin/sh
#################################################################
# HELP COMMANDS DOING AISTRO AIRFLOW OP  
#################################################################

# 1) access postgres_default posgre 
<<COMMENT1
CONTAINER ID        IMAGE                                  COMMAND                  CREATED             STATUS              PORTS                                        NAMES
04017a0b43d7        de-airflow-docker-dev/airflow:latest   "tini -- /entrypoint…"   3 hours ago         Up 3 hours          5555/tcp, 8793/tcp, 0.0.0.0:8080->8080/tcp   deairflowdockerdev_webserver_1
592fba461268        de-airflow-docker-dev/airflow:latest   "tini -- /entrypoint…"   3 hours ago         Up 3 hours          5555/tcp, 8080/tcp, 8793/tcp                 deairflowdockerdev_scheduler_1
86d9a6be7896        postgres:10.1-alpine                   "docker-entrypoint.s…"   3 hours ago         Up 3 hours          0.0.0.0:5432->5432/tcp                       deairflowdockerdev_postgres_1
COMMENT1

docker ps -a 
docker exec -it <posgre_container_id> bash 
# bash-4.3#psql --host localhost -U postgres
# postgres=# \l
# postgres=# \d 
