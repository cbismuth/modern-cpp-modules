cmake_minimum_required(VERSION 3.10)

project(puzzles-parent VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

enable_testing()

add_subdirectory(vendors/google/googletest)

add_subdirectory(libs)
add_subdirectory(tests)
add_subdirectory(app)
