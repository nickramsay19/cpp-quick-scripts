#!/bin/bash

# prevent this script from running outside of project root (same dir as script itself)
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
CURRENT_DIR="$(pwd)"

# check if the current directory is the same as the script directory
if [ "$CURRENT_DIR" != "$SCRIPT_DIR" ]; then
    echo "Error: script must be executed from the project root."
    exit 1
fi

# remove files mistakenly generated in the root folder
rm -rf cmake_install.cmake CMakeCache.txt CMakeFiles Makefile

# remove build dirs
rm -rf build bin

# delete libs
rm -rf lib

# delete temporary Catch2 directory if it has mistakenly been left undeleted
rm -rf Catch2


