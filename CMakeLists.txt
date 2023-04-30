cmake_minimum_required(VERSION 3.16)
project(mac-poweruser)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_COMPILER "clang++")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -Wpedantic")

# Create build directory if it doesn't exist
if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/build)
    message("Creating build directory...")
    file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build)
endif()

# Set the output directories
set(CMAKE_BINARY_DIR ${PROJECT_SOURCE_DIR}/build)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}) # build final in build/

set(CMAKE_FILES_DIRECTORY ${CMAKE_BINARY_DIR}/CMakeFiles)

# Add the source files
file(GLOB_RECURSE SOURCES "${PROJECT_SOURCE_DIR}/src/*.cpp")

# Build the executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Set the include directories
target_include_directories(${PROJECT_NAME} PRIVATE "${PROJECT_SOURCE_DIR}/include")
