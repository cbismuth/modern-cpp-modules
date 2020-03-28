# CMake configuration
cmake_minimum_required(VERSION 3.10)

# Project configuration
project(puzzles-parent VERSION 1.0 LANGUAGES CXX)

# C/C++ compiler configuration
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Clang formatter configuration
find_program(CLANG_FORMAT "clang-format")
if (CLANG_FORMAT)
    file(GLOB_RECURSE
        CHECK_CXX_SOURCE_FILES
            app/*.h   app/*.cpp
            libs/*.h  libs/*.cpp
            tests/*.h tests/*.cpp
    )
    add_custom_target(format
        COMMAND
            ${CLANG_FORMAT} -i -style=file ${CHECK_CXX_SOURCE_FILES}
        COMMENT
            "Applying `clang-format` on source files"
    )
endif ()

# Code coverage configuration
option(CODE_COVERAGE "Enable code coverage reporting" OFF)
if (CODE_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    SET(CMAKE_C_FLAGS   "-g -O0 -Wall -W -fprofile-arcs -ftest-coverage")
    SET(CMAKE_CXX_FLAGS "-g -O0 -Wall    -fprofile-arcs -ftest-coverage")
    SET(CMAKE_EXE_LINKER_FLAGS "-fprofile-arcs -ftest-coverage")
endif ()

# Google Test configuration
enable_testing()
add_subdirectory(vendors/google/googletest)

# Project source directories
add_subdirectory(libs)
add_subdirectory(tests)
add_subdirectory(app)
