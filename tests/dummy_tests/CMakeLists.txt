project(puzzles_libdummy_tests)

add_executable(${PROJECT_NAME} main.cpp dummy_test.cpp)

add_test(NAME ${PROJECT_NAME} COMMAND ${PROJECT_NAME})

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        gtest
        libs::puzzles_libdummy
)
