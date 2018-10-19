#!/bin/sh

#https://stackoverflow.com/questions/23769478/how-to-change-port-for-jenkins-window-service-when-8080-is-being-used


# 1) run jenkins server local 
# at the jenkins.war location 
# can modify the port (8081-> 8866->3333...)
java -jar jenkins.war --httpPort=8081