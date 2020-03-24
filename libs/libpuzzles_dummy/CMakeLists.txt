project(libpuzzles_dummy)

add_library(${PROJECT_NAME} STATIC dummy.cpp)

add_library(libs::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

# https://cmake.org/cmake/help/latest/prop_tgt/INTERFACE_INCLUDE_DIRECTORIES.html
target_include_directories(${PROJECT_NAME}
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)
