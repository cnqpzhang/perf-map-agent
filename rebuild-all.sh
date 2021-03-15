#!/bin/bash

if [ "x${JAVA_HOME}" = "x" ] || [ ! -f ${JAVA_HOME}/bin/java ]; then
  echo "JAVA_HOME is not a valid path: ($JAVA_HOME)"
  exit 1
fi

rm -rf CMakeFiles CMakeCache.txt cmake_install.cmake Makefile out >/dev/null 2>&1
cmake .
make
