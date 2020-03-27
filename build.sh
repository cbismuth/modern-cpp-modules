#!/usr/bin/env bash

clear -x

# Install prerequisites on Debian / Ubuntu systems
if [[ -f /etc/lsb-release ]]; then
  sudo apt-get -y install build-essential cmake clang-format git
fi

# Install Google Test dependency
DIR_VENDORS_GTEST="vendors/google/googletest"

if [[ ! -d  "${DIR_VENDORS_GTEST}" ]]; then
  mkdir -p "${DIR_VENDORS_GTEST}"
  git clone https://github.com/google/googletest.git "${DIR_VENDORS_GTEST}"
fi

cd "${DIR_VENDORS_GTEST}" || exit 1
git reset --hard HEAD
git clean -xffd
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
make clean format all test
app/puzzles
cd - || exit 1
