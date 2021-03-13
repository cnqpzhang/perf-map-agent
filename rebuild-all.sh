#!/bin/bash

rm -rf CMakeFiles CMakeCache.txt cmake_install.cmake Makefile out >/dev/null 2>&1
cmake .
make
