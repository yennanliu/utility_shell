#!/bin/sh
#######################################################
# REF 
# https://stackoverflow.com/questions/46513639/how-to-downgrade-java-from-9-to-8-on-a-macos-eclipse-is-not-running-with-java-9

# USEFUL COMMAND 
# 0) check current java version 
java -version

# 0')  LIST ALL INSYALLED JAVA AND THEIR HOME 
# List Java versions installed
/usr/libexec/java_home -V

# 0'') export java 8 home 
# Java 8
#export JAVA_HOME=$(/usr/libexec/java_home -v 8)
#######################################################

# 1) intall JAVA 8 
# http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

# 2) AFTER INSTALL JAVA 8, CHECK all installed Java versions 
/usr/libexec/java_home -V

# 3) Edit .bash_profile
sudo nano ~/.bash_profile
# Add JAVA 8 as default. (Add below line to bash_profile file).
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#Now Press CTRL+X to exit the bash. Press 'Y' to save changes.


# 4) Reload bash_profile
source ~/.bash_profile
# 5) Confirm current version of Java
java -version
