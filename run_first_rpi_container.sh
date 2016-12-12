#!/bin/sh

# HARDWARE/OS: rpi 1 modelB+ / raspbian:jessie  
# 
# Executing script then try,
# $ cat /etc/issue
# $ cat /etc/hostname
# $ cat /etc/hosts
# $ uname -a
# $ cat /proc/version
# $ ...
# $ exit

IMAGE_NAME="resin/rpi-raspbian:jessie-20161207"
CONTAINER_NAME="my_first_rpi"
TOPDIR=${PWD}

# remove old container if running
docker ps -a | grep ${CONTAINER_NAME} | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

# run your first rpi container
docker run --name ${CONTAINER_NAME} -ti ${IMAGE_NAME} /bin/bash
