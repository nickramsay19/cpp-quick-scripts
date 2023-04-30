#!/bin/bash

# check if the parent directory name is "cpp-mac-poweruser"
if [[ "$(basename $PWD)" != "cpp-mac-poweruser" ]]; then
  echo "Error: This script should be executed from the cpp-mac-poweruser directory."
  exit 1
fi

# remove files mistakenly generated in the root folder
rm -rf cmake_install.cmake CMakeCache.txt CMakeFiles Makefile

# remove build dirs
rm -rf build bin


