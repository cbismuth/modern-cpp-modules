project(puzzles)

add_executable(${PROJECT_NAME} main.cpp)

configure_file(config.h.in config.h)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        "${PROJECT_BINARY_DIR}"
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        libs::dummy
)
