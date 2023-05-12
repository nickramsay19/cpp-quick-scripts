# cpp-quick-scripts 
> Nicholas Ramsay

A starter template for my C++ projects. 
## Usage
Run `setup.sh` to setup CMake and install Catch2. Then build with `build.sh`.
```sh
sh setup.sh
sh build.sh
```

You must have Python3 in order to install Catch2 via the method in `setup.sh`. If you need to specify the python command to use, set the `PY` variable in `config.sh`. 

### Testing
```
sh test.sh
```

## Install tomlplusplus
See the [tomlplusplus GitHub page](https://github.com/marzer/tomlplusplus).

Get the header file from: `https://raw.githubusercontent.com/marzer/tomlplusplus/master/toml.hpp`

## Install Catch2
Catch2 is installed locally into `lib/Catch2` during the setup in `setup.sh`. To do this manually, the procedure is as follows:

```sh
git clone https://github.com/catchorg/Catch2.git
cd Catch2
```

### Install locally
```sh
python ./tools/scripts/generateAmalgamatedFiles.py
mv ./Catch2/extras/catch_amalgamated.hpp ./lib/Catch2/catch_amalgamated.hpp
mv ./Catch2/extras/catch_amalgamated.cpp ./lib/Catch2/catch_amalgamated.cpp
rm -rf Catch2
```

### Install globally
See [Catch2's installation guide](https://github.com/catchorg/Catch2/blob/devel/docs/cmake-integration.md#installing-catch2-from-git-repository). 
```
cmake -Bbuild -H. -DBUILD_TESTING=OFF
sudo cmake --build build/ --target install
```

