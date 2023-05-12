#!/bin/bash

# prevent this script from running outside of project root (same dir as script itself)
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
CURRENT_DIR="$(pwd)"

# check if the current directory is the same as the script directory
if [ "$CURRENT_DIR" != "$SCRIPT_DIR" ]; then
    echo "Error: script must be executed from the project root."
    exit 1
fi

# get config variables
source config.sh

# create lib directory if it doesnt exist
if [ ! -d "lib" ]; then
	echo "Creating lib directory."
	mkdir lib
fi

# install Catch2
if [ ! -d "lib/catch2" ]; then
	echo "Installing Catch2 into lib/catch2"
	mkdir -p lib/Catch2
	git clone https://github.com/catchorg/Catch2.git
	$PY ./Catch2/tools/scripts/generateAmalgamatedFiles.py
    ls ./Catch2/extras/
	mv ./Catch2/extras/catch_amalgamated.hpp ./lib/Catch2/catch_amalgamated.hpp
	mv ./Catch2/extras/catch_amalgamated.cpp ./lib/Catch2/catch_amalgamated.cpp
	rm -rf Catch2

	# must generate alias import for #include's to use
	# otherwise we have to modify the include path in catch_amalgamated.cpp ...
	# ... and I'd prefer to leave those files untouched for consistency
	echo "#pragma once\n\n#include <Catch2/catch_amalgamated.hpp>" > lib/Catch2/Catch2.hpp
else
	echo "Catch2 already installed."
fi

# setup CMake
# check that the build directory doesn't exist already
if [ ! -d "build" ]; then
	# setup the cmake build directory for the first time
	mkdir build
	cmake -B build -S .
else
	echo "CMake build directory already configured."
fi

echo "Setup complete."
