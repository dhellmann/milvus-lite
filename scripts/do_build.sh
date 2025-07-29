#!/bin/bash -x

mkdir -p conan-cache
chmod 0777 conan-cache
bash -x ./build.sh ./Dockerfile.manylinux.x86_64 main  2>&1 | tee build.log
