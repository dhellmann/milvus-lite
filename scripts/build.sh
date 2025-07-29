#!/bin/bash -x

# Licensed to the LF AI & Data foundation under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TAG="main"
IMAGE_TAG="latest"

if [ "$#" -eq 0 ]; then
    echo "Please set dockerfile path"
fi

DOCKERFILE=$1
podman build -t build_milvus_lite:$IMAGE_TAG -f $DOCKERFILE .

if [ "$#" -eq 2 ]; then
    TAG=$2
fi
VOLS=""
if [ "$#" -eq 3 ]; then
    CACAN_CACHE=$3
    VOLS="-v $CACAN_CACHE:/workspace/conan:rw,exec"
fi
podman run \
       -it \
       --rm \
       --security-opt label=disable \
       -e CONAN_USER_HOME=/workspace/conan \
       --ulimit host \
       --pids-limit -1 \
       $VOLS \
       -v $PWD:/workspace/dist:rw,exec \
       build_milvus_lite:$IMAGE_TAG \
       /workspace/build_milvus_lite.sh $TAG
