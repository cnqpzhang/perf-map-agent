#!/bin/bash

pushd perflame

ARCHS=(x64 aarch64)
for ARCH in ${ARCHS[@]}; do
    rm -rf perflame.${ARCH}
    rm -rf perflame.${ARCH}.tgz
    wget http://10.30.5.24:8000/sh2sc/Tests/altra/flamegraph/perflame.${ARCH}.tgz
    tar xf perflame.${ARCH}.tgz
    cp ../bin/* perflame.${ARCH}/perf-map-agent/bin/ -f
    tar czf perflame.${ARCH}.tgz perflame.${ARCH}
done
sshpass -p 123456 scp -r *.tgz amptest@fs:/fileserver/sh2sc/Tests/altra/flamegraph/;
sshpass -p 123456 scp -r *.tgz amptest@beaker3:/fileserver/sh2sc/Tests/altra/flamegraph/

popd