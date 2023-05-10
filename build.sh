#!/bin/bash

# prevent this script from running outside of project root (same dir as script itself)
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
CURRENT_DIR="$(pwd)"

# check if the current directory is the same as the script directory
if [ "$CURRENT_DIR" != "$SCRIPT_DIR" ]; then
    echo "Error: script must be executed from the project root."
    exit 1
fi

# format code according to specified style
find src -iname "*.cpp" -o -iname "*.hpp" -exec clang-format -style=.clang-format -Werror -i {} \;

# configure cmake for the first time
if [ ! -f "build/CMakeCache.txt" ]; then
	mkdir -p build
    cmake -B build -S .
fi

# start building with cmake
cd build
cmake --build . --target all
cd ..

