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
# don't make changes, simply output style errors
find src -iname "*.cpp" -o -iname "*.hpp" -exec clang-format -Werror --dry-run -style=.clang-format {} \;

# build project again
# TODO remove this as default behaviour, move to optional cl arg behaviour
sh build.sh

# run test
./build/test_all


