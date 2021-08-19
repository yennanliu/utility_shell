# step 1) download
wget https://archive.apache.org/dist/kafka/2.4.1/kafka_2.12-2.4.1.tgz

# step 2) unzip
tar zxvf kafka_2.12-2.4.1.tgz

# step 3) go to the file
cd kafka_2.12-2.4.1

# step 4) create/update conf
consumer_dev.properties
# bootstrap.servers=xxx:9092
# security.protocol=SASL_PLAINTEXT
# sasl.mechanism=GSSAPI

producer_dev.properties
bootstrap.servers=xxx:9092
security.protocol=SASL_PLAINTEXT
sasl.mechanism=GSSAPI

# step 5) run the producer

# step 6) run the consumer
