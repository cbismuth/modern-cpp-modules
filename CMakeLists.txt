cmake_minimum_required(VERSION 3.10)

project(puzzles-parent VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

FILE(GLOB_RECURSE CHECK_CXX_SOURCE_FILES
    app/*.h app/*.cpp
    libs/*.h libs/*.cpp
    tests/*.h tests/*.cpp
)

FIND_PROGRAM(CLANG_FORMAT "clang-format")
IF(CLANG_FORMAT)
    ADD_CUSTOM_TARGET(format
        COMMAND
            ${CLANG_FORMAT} -i -style=file ${CHECK_CXX_SOURCE_FILES}
        COMMENT
            "Auto formatting of all source files"
    )
ENDIF()


enable_testing()

add_subdirectory(vendors/google/googletest)

add_subdirectory(libs)
add_subdirectory(tests)
add_subdirectory(app)
