project(core)

file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true main.cpp include/*.h src/*.h src/*.cpp)

add_library(${PROJECT_NAME} ${SOURCES})

add_library(libs::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)
