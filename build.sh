#!/bin/bash

CWD=$(pwd -P)
SRC=$CWD"/src"
BUILD=$CWD="/build"

#clang-format --style=file:$CWD"/.clang-format" -Werror -i src/*.cpp src/*.h
#find foo/bar/ -iname *.h -o -iname *.cpp | xargs clang-format -i
find $SRC -iname "*.cpp" -o -iname "*.hpp" -exec clang-format -style=.clang-format -Werror -i {} \;


cmake --build $BUILD --target all

