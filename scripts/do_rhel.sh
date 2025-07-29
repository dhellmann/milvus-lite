#!/bin/bash -xe

CACHE_DIR=conan-cache
mkdir -p $CACHE_DIR

podman build -t milvus-lite-build:latest -f ./Containerfile.rhel .
podman run \
       -it \
       milvus-lite-build:latest \
       --ulimit host \
       --pids-limit -1 \
       --security-opt label=disable

#       -e CONAN_USER_HOME=/work/.conan \
#       --volume "$CACHE_DIR:/work/conan:rw,exec"
