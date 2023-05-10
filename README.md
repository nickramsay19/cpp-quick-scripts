# cpp-cmake-catch2-project-template

A starter template for my C++ projects. 

## Details & Features 
* `clang++ -std=c++20`
* CMake
* Testing with [Catch2](https://github.com/catchorg/Catch2/tree/devel)
* Provided convenience scripts including `build.sh`, `test.sh`.

## Project File Structure
```
├── CMakeLists.txt
├── README.md
├── build
│   ├── CMakeCache.txt
│   ├── CMakeFiles
│   │   ├── 3.23.2
│   │   │   ├── CMakeCCompiler.cmake
│   │   │   ├── CMakeCXXCompiler.cmake
│   │   │   ├── CMakeDetermineCompilerABI_C.bin
│   │   │   ├── CMakeDetermineCompilerABI_CXX.bin
│   │   │   ├── CMakeSystem.cmake
│   │   │   ├── CompilerIdC
│   │   │   │   ├── CMakeCCompilerId.c
│   │   │   │   ├── CMakeCCompilerId.o
│   │   │   │   └── tmp
│   │   │   └── CompilerIdCXX
│   │   │       ├── CMakeCXXCompilerId.cpp
│   │   │       ├── CMakeCXXCompilerId.o
│   │   │       └── tmp
│   │   ├── CMakeDirectoryInformation.cmake
│   │   ├── CMakeError.log
│   │   ├── CMakeOutput.log
│   │   ├── CMakeTmp
│   │   ├── Makefile.cmake
│   │   ├── Makefile2
│   │   ├── Progress
│   │   │   ├── 1
│   │   │   └── count.txt
│   │   ├── TargetDirectories.txt
│   │   ├── cmake.check_cache
│   │   ├── mac-poweruser.dir
│   │   │   ├── DependInfo.cmake
│   │   │   ├── build.make
│   │   │   ├── cmake_clean.cmake
│   │   │   ├── compiler_depend.make
│   │   │   ├── compiler_depend.ts
│   │   │   ├── depend.make
│   │   │   ├── flags.make
│   │   │   ├── link.txt
│   │   │   ├── progress.make
│   │   │   └── src
│   │   │       └── main.cpp.o.d
│   │   └── progress.marks
│   ├── Makefile
├── build.sh
├── clean.sh
├── src
│   └── main.cpp
└── test.sh
```
## Install Catch2

To install via git:
```sh
git clone https://github.com/catchorg/Catch2.git
cd Catch2
```

### Install locally
```
python ./tools/scripts/generateAmalgamatedFiles.py
mv ./extras/catch_amalgamated.hpp ./lib/catch2/catch.hpp
mv ./extras/catch_amalgamated.cpp ./lib/catch2/catch.cpp
```

### Install globally
See [Catch2's installation guide](https://github.com/catchorg/Catch2/blob/devel/docs/cmake-integration.md#installing-catch2-from-git-repository). 
```
cmake -Bbuild -H. -DBUILD_TESTING=OFF
sudo cmake --build build/ --target install
```

