# 1) create a new Java Lambda func
# Ref : https://github.com/yennanliu/LambdaHelloWorld/blob/master/lab4/KinesisClient/src/main/java/com/yen/cloudwatch/CWatchProducer2.java

# step 1) init java mvn project
# step 2) add dep, java handler
# step 3) mvn clean package
# step 4) go to AWS Lambda UI create new Lambda
# NOTE !!! Lambda func name NEED to SAME as the main class
# e.g. 
# main class = CWatchProducer2
# if Handler = com.yen.cloudwatch.CWatchProducer2::handleRequest
# then Lambda func name should be "CWatchProducer2"

