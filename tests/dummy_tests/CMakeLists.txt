project(dummy_tests)

file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true main.cpp include/*.h src/*.h src/*.cpp)

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        gtest
        libs::dummy
)
