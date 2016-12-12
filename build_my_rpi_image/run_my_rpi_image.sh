#!/bin/sh

# HARDWARE/OS: rpi 1 modelB+ / raspbian:jessie 

IMAGE_NAME="my_rpi_image"
CONTAINER_NAME="my-rpi-image"
TOPDIR=${PWD}
BUILD_SCRIPT="build_image.sh"

# build image if not avaliable 
docker images | grep -q ${IMAGE_NAME} \
 && echo Found image: ${IMAGE_NAME}, skip build script. \
 || (echo Not found image: ${IMAGE_NAME} && ./${BUILD_SCRIPT})


# remove old container if running
docker ps -a | grep ${CONTAINER_NAME} | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

# run your first rpi container
docker run --name ${CONTAINER_NAME} -ti ${IMAGE_NAME} /bin/bash
