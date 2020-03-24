project(libpuzzles_dummy_tests)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        libs::libpuzzles_dummy
)

add_test(${PROJECT_NAME} ${PROJECT_NAME})
