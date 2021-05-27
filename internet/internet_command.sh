#!/bin/sh

# 1. check ports are listened in local 
netstat -an

# 2. check ports with pid are listened in local -> to close the no needed ones
netstat -anb