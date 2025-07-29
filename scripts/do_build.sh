#!/bin/bash -x

SCRIPTDIR=$(dirname $0)

mkdir -p $SCRIPTDIR/conan-cache
chmod 0777 $SCRIPTDIR/conan-cache

bash -x $SCRIPTDIR/build.sh $SCRIPTDIR/Dockerfile.manylinux.x86_64  2>&1 | tee $SCRIPTDIR/build.log
