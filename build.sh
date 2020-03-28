#!/usr/bin/env bash

set -euo pipefail

# Install prerequisites on Debian based systems only
if [[ -f /etc/lsb-release ]]; then
  sudo apt-get update
  sudo apt-get -y install ca-certificates build-essential git cmake make clang clang-format gcc g++ lcov
fi

# Set Google Test dependency path
DIR_VENDORS_GTEST="vendors/google/googletest"

# Clone Google Test repository if not exists
if [[ ! -d  "${DIR_VENDORS_GTEST}" ]]; then
  mkdir -p "${DIR_VENDORS_GTEST}"
  git clone https://github.com/google/googletest.git "${DIR_VENDORS_GTEST}"
fi

# Clean Google Test working copy and checkout tag
cd "${DIR_VENDORS_GTEST}" || exit 1
git reset --hard HEAD
git clean -xffd
git checkout master
git pull
git -c advice.detachedHead=false checkout release-1.10.0
cd - || exit 1

# Set project debug output path
CMAKE_OUTPUT_DEBUG="cmake-build-debug"

# Clean project debug output path
rm    -rf "${CMAKE_OUTPUT_DEBUG}"
mkdir -p  "${CMAKE_OUTPUT_DEBUG}"

# Change directory to project debug output path
cd "${CMAKE_OUTPUT_DEBUG}" || exit 1

# Build project with debug options
cmake -DCMAKE_BUILD_TYPE=Debug -DCODE_COVERAGE=ON ..
cmake --build . --config Debug -- -j "$(nproc)"

# Run tests
ctest -j "$(nproc)" --output-on-failure

# Run application
app/puzzles

# Generate coverage reports
lcov --directory . --capture --output-file coverage.info
lcov --remove coverage.info '*gtest*' '/usr/*' --output-file coverage.info.cleaned
genhtml -o coverage coverage.info.cleaned

# Change directory back to previous one
cd - || exit 1

# Set project release output path
CMAKE_OUTPUT_RELEASE="cmake-build-release"

# Clean project release output path
rm    -rf "${CMAKE_OUTPUT_RELEASE}"
mkdir -p  "${CMAKE_OUTPUT_RELEASE}"

# Change directory to project release output path
cd "${CMAKE_OUTPUT_RELEASE}" || exit 1

# Build project with release options
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release -- -j "$(nproc)"

# Change directory back to previous one
cd - || exit 1
