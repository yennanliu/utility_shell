#!/bin/sh
#################################################################
#  KAFKA CLI COMMANDS   
#################################################################

############################  A) kafka basics  (utility_Java/kafka_learning/kafka_begineer_course/src/main/java/com/github/yen/kafka/tutorial1)
# launch zookeeper and kafka
brew services start zookeeper
brew services start kafka

############################  B) kafka basics  (utility_Java/kafka_learning/kafka_begineer_course/src/main/java/com/github/yen/kafka/tutorial1)
# 1) kafka-topics: show all commands as list doc.   
kafka-topics 

# 2) # run kafka-topics ref on zoopkeer (its port)
# the number of replication-factor should always less then number of broker 
kafka-topics  --zookeeper  127.0.0.1:2181 --topic first_topic --create  --partitions 3 --replication-factor 1

# 3) list the infromation inside topic 
kafka-topics  --zookeeper  127.0.0.1:2181 --list 

# 4) describe the the topic 
kafka-topics  --zookeeper  127.0.0.1:2181 --topic first_topic --describe 

# 5) delete the topic 
kafka-topics  --zookeeper  127.0.0.1:2181 --topic second_topic --create  --partitions 6 --replication-factor 1
kafka-topics  --zookeeper  127.0.0.1:2181 --list 
kafka-topics  --zookeeper  127.0.0.1:2181 --topic second_topic --delete   # just mark the topic for deletion 

# 6) set up producer 
kafka-console-producer  --broker-list  127.0.0.1:9092 --topic first_topic 
# if start from a new broker not in the list --> still be fine, BUT ALWAYS CREATE A TOPIC BEFORE USING IT 
kafka-console-producer  --broker-list  127.0.0.1:9092 --topic new_topic 

# 7) set up producer property 
kafka-console-producer  --broker-list  127.0.0.1:9092 --topic first_topic --producer-property acks=all  

# 8) set up cosumer (read from now, i.e. only read the producer msg when this consumer is set up ) (NOW, OPEN THE OTHER TERMIANL AND RUN THE BELOW COMMAND )
kafka-console-consumer   --bootstrap-server  127.0.0.1:9092 --topic first_topic 

# 9) set up cosumer (read from beginning, i.e. read all msg) (NOW, OPEN THE OTHER TERMIANL AND RUN THE BELOW COMMAND )
kafka-console-consumer   --bootstrap-server  127.0.0.1:9092 --topic first_topic  --from-beginning 

# 10) list the consumer groups 
kafka-consumer-groups   --bootstrap-server  127.0.0.1:9092 --list

# 11) describe the consumer groups 
kafka-consumer-groups   --bootstrap-server  127.0.0.1:9092 --describe --group my-first-application

# 12) start a new consumer with topic and group application 
kafka-console-consumer   --bootstrap-server  127.0.0.1:9092 --topic first_topic --group my-first-application

# 13) re-set kafka consumer group 
kafka-consumer-groups   --bootstrap-server  127.0.0.1:9092  --group my-first-application --reset-offsets --to-earliest --execute  --topic first_topic

# 14) shift consumer groups 
kafka-consumer-groups   --bootstrap-server  127.0.0.1:9092  --group my-first-application --reset-offsets --shift-by 2  --execute  --topic first_topic

# 15) show Producer with keys
kafka-console-producer --broker-list 127.0.0.1:9092 --topic first_topic --property parse.key=true --property key.separator=,

# 16) show consumer with keys 
kafka-console-consumer --bootstrap-server 127.0.0.1:9092 --topic first_topic --from-beginning --property print.key=true --property key.separator=,


############################  B) kafka Twitter   (utility_Java/kafka_learning/kafka_begineer_course/src/main/java/com/github/yen/kafka/tutorial2)
# 1) create twitter topic  
kafka-topics --zookeeper 127.0.0.1:2181 --create --topic twitter_tweets --partitions 6 --replication-factor 1 

# 2) launch a consumer 
kafka-console-consumer   --bootstrap-server  127.0.0.1:9092 --topic twitter_tweets  
