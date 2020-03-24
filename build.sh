#!/usr/bin/env bash

# Install prerequisites on Debian / Ubuntu systems
if [[ -f /etc/lsb-release ]]; then
  sudo apt-get -y install build-essential cmake git
fi

# Install Google Test dependency
DIR_VENDOR_GTEST="vendor/google/googletest"

if [[ ! -d  "${DIR_VENDOR_GTEST}" ]]; then
  mkdir -p "${DIR_VENDOR_GTEST}"
  git clone https://github.com/google/googletest.git "${DIR_VENDOR_GTEST}"
fi

cd "${DIR_VENDOR_GTEST}" || exit 1
git reset --hard HEAD
git clean -xfd
git checkout master
git pull
git -c advice.detachedHead=false checkout release-1.10.0
cd - || exit 1

# Build project
CMAKE_OUTPUT_DEBUG="cmake-build-debug"

rm    -rf "${CMAKE_OUTPUT_DEBUG}"
mkdir -p  "${CMAKE_OUTPUT_DEBUG}"

cd "${CMAKE_OUTPUT_DEBUG}" || exit 1
cmake ..
make clean all test
cd - || exit 1
