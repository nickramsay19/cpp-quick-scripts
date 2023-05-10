#!/bin/bash

# prevent this script from running outside of project root (same dir as script itself)
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
CURRENT_DIR="$(pwd)"

# check if the current directory is the same as the script directory
if [ "$CURRENT_DIR" != "$SCRIPT_DIR" ]; then
    echo "Error: script must be executed from the project root."
    exit 1
fi

# recursivel run clang-format on every .cpp and .hpp file in src 
find src -iname "*.cpp" -o -iname "*.hpp" -exec clang-format -style=.clang-format -Werror -i {} \;

# configure cmake for the first time if not already configured
if [ ! -f "build/CMakeCache.txt" ]; then
	mkdir -p build
    cmake -B build -S .
fi

# build project again
cmake --build build --target all

