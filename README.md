# Puzzles

![CI](https://github.com/cbismuth/puzzles/workflows/CI/badge.svg)
[![codecov](https://codecov.io/gh/cbismuth/puzzles/branch/master/graph/badge.svg)](https://codecov.io/gh/cbismuth/puzzles)

This repository contains puzzles written in the C/C++ programming language.

## Prerequisites

Required dependencies to build and run this project are:

* ca-certificates
* git
* cmake
* make
* clang-format
* g++
* lcov

## Build

This project uses the CMake build system as well as a convenience [build.sh](build.sh) script.

This build script also executes `clang-format` to format C/C++ source files according to this [.clang-format](.clang-format) configuration file,
and debug build step generates code coverage reports uploaded to [codecov.io](https://codecov.io/gh/cbismuth/puzzles).

## Issues

Here is how issues are triaged:

* **Bug**: identifies an unexpected result or application behaviour.
* **Feature**: adds a new end-user feature.
* **Enhancement**: improves the way the application behaves but produces the same result.

## Credits

Written by [Christophe Bismuth](https://www.linkedin.com/in/cbismuth/), licensed under the [The MIT License (MIT)](LICENSE.md).

## References

* [Modern CMake Template](https://github.com/rvarago/modern-cmake-template) by [Rafael Varago](https://github.com/rvarago).
* [C++ project setup with CMake & unit tests (google test)](https://raymii.org/s/tutorials/Cpp_project_setup_with_cmake_and_unit_tests.html) by [Remy van Elst](https://raymii.org/s/static/About.html).
* Proteus `clang-format` [configuration files](https://gitlab.cern.ch/proteus/proteus/-/commit/8d906a45801c03832531e243f41f5f5a83177de0).
