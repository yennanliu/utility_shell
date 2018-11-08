#!/bin/sh


# list all running instances 
docker ps -a 

# list all running instances id 
docker ps -aq

<<COMMENT1

"""

e.g.

yennanl@macbookpro:~$ docker ps -a 
CONTAINER ID        IMAGE                          COMMAND                  CREATED             STATUS                      PORTS                                        NAMES
fb52a9ca0f03        noths-airflow/airflow:latest   "tini -- /entrypoint…"   About an hour ago   Up About an hour            5555/tcp, 8793/tcp, 0.0.0.0:8080->8080/tcp   nothsairflow_webserver_1
42bc3d012745        noths-airflow/airflow:latest   "tini -- /entrypoint…"   About an hour ago   Up About an hour            5555/tcp, 8080/tcp, 8793/tcp                 nothsairflow_scheduler_1
43aeb2c01151        postgres:10.1-alpine           "docker-entrypoint.s…"   About an hour ago   Up About an hour            0.0.0.0:5432->5432/tcp                       nothsairflow_postgres_1
07fd9e22eeb3        yennanliu/mac_de_env:v1        "/usr/bin/tini -- /b…"   8 days ago          Exited (255) 30 hours ago                                                friendly_saha
5881a29d80c1        fa40768aebb5                   "tini -- /entrypoint…"   8 days ago          Exited (255) 30 hours ago   5555/tcp, 8080/tcp, 8793/tcp                 keen_kowalevski
98246785ec30        yennanliu/mac_de_env:v1        "/usr/bin/tini -- /b…"   8 days ago          Exited (255) 30 hours ago                                                distracted_spence
c7e546ccc6e2        yennanliu/mac_de_env:v1        "/usr/bin/tini -- ba…"   9 days ago          Exited (255) 30 hours ago                                                dreamy_leavitt
12926386274f        mac_de_env                     "/usr/bin/tini -- /b…"   9 days ago          Exited (0) 9 days ago                                                    wonderful_spence
42599b094b10        mac_de_env                     "/usr/bin/tini -- /b…"   9 days ago          Exited (127) 9 days ago                                                  mac_de_env
36d78cd2ee20        9fde56c5d0db                   "/bin/sh -c 'apt-get…"   9 days ago          Exited (1) 9 days ago                                                    modest_khorana
ceea2c0d2b78        a36cef56036d                   "/bin/sh -c 'apt-get…"   9 days ago          Exited (1) 9 days ago                                                    pensive_ritchie
4e2d06552faf        a36cef56036d                   "/bin/sh -c 'apt-get…"   9 days ago          Exited (100) 9 days ago                                                  musing_hermann
yennanl@macbookpro:~$ docker ps -aq
fb52a9ca0f03
42bc3d012745


yennanl@macbookpro:~$ docker logs fb52a9ca0f03

"""
COMMENT1

docker logs  <ur_docker_instance_id>
