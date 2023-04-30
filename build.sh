#!/bin/bash

# check if the parent directory name is "cpp-mac-poweruser"
if [[ "$(basename $PWD)" != "cpp-mac-poweruser" ]]; then
  echo "Error: This script should be executed from the cpp-mac-poweruser directory."
  exit 1
fi

find src -iname "*.cpp" -o -iname "*.hpp" -exec clang-format -style=.clang-format -Werror -i {} \;

# configure cmake for the first time
if [ ! -f "build/CMakeCache.txt" ]; then
	mkdir -p build
    cmake -B build -S .
fi


cmake --build build --target all

