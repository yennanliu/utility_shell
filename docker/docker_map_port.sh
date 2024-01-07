# 1) syntax

# # map 8080 port (in docker) to 8082 (external)
# docker run -p 8082:8080 --rm -v /Users/yennanliu/docker_file \
# -v /Users/yennanliu/docker_file/flink -e FLINK_HOME=/Users/yennanliu/flink-1.17.2 --name zeppelin apache/zeppelin:0.10.0

docker run -p <external_port>:<port_in_docker>
