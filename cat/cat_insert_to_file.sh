#!/bin/sh

# https://github.com/yennanliu/kafka-examples/blob/master/StructuredStreamingRefApp/scripts/spark-kafka.sh

# example 1
# cat > kafka_client_jaas.conf<<EOF
# KafkaClient {
#     com.sun.security.auth.module.Krb5LoginModule required
#     useKeyTab=true
#     storeKey=true
#     keyTab="$SPARK_KEYTAB"
#     useTicketCache=false
#     serviceName="kafka"
#     principal="$SPARK_USER@${SPARK_REALM}";
# };
# EOF


cat > output.conf<<EOF
config {
	someConfig1
	someConfig2
	someConfig3
};
EOF
