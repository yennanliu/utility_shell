#!/bin/sh



#################################################################
# RUNNING JENKINS TEST PROCESS LOCAL 
#################################################################


# first make sure you have built a container with test dependencies installed:
make build

# quickly run unit tests (2s), but fails on integration tests that need db
make docker_tox


# quite quickly run all tests (20s) without reinstalling tox deps
make build && make container_test