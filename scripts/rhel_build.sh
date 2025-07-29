#!/bin/bash -x

cd /work/milvus-lite/python/
#mkdir -p /work/conan

#export HOME=/work

conan profile new default --detect
conan profile update settings.compiler.libcxx=libstdc++11 default

#python3 setup.py bdist_wheel
python3 -m build --wheel
