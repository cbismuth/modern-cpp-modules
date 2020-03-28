cmake_minimum_required(VERSION 3.10)

project(puzzles-parent VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_program(CLANG_FORMAT "clang-format")
if (CLANG_FORMAT)
    file(GLOB_RECURSE
        CHECK_CXX_SOURCE_FILES
            app/*.h app/*.cpp
            libs/*.h libs/*.cpp
            tests/*.h tests/*.cpp
    )
    add_custom_target(format
        COMMAND
            ${CLANG_FORMAT} -i -style=file ${CHECK_CXX_SOURCE_FILES}
        COMMENT
            "Applying `clang-format` on all source files"
    )
endif ()

enable_testing()

add_subdirectory(vendors/google/googletest)

add_subdirectory(libs)
add_subdirectory(tests)
add_subdirectory(app)
