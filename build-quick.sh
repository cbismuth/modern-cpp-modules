#!/usr/bin/env bash

# Build project
CMAKE_OUTPUT_DEBUG="cmake-build-debug"

cd "${CMAKE_OUTPUT_DEBUG}" || exit 1
cmake ..
make all test
app/puzzles
cd - || exit 1
