#!/usr/bin/env bash

set -euo pipefail

# Install vendors
./vendors.sh

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

# Run tests with memory checks
ctest -j "$(nproc)" --output-on-failure --force-new-ctest-process --test-action memcheck

# Run application
app/HelloApp

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
