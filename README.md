# cpp-cmake-catch2-project-template

A starter template for my C++ projects. 

## Details & Features 
* `clang++ -std=c++20`
* CMake
* Testing with [Catch2](https://github.com/catchorg/Catch2/tree/devel)
* clang-format
* Provided convenience scripts including `build.sh`, `test.sh`.

## Project File Structure
```
├── build
│   ├── CMakeFiles
│   │   ├── main.dir/
│   │   └── tests.dir/
├── lib
│   └── catch2/
├── src
│   ├── include/
│   ├── main.cpp
│   └── main.test.cpp
├── CMakeLists.txt
├── README.md
├── build.sh
├── clean.sh
├── test.sh
├── setup.sh
└── config.ini
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

