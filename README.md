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

## Adding Tasks to `tasks.toml`
```toml
[script.my_new_script]
aliases = ["my_new_scr", "an_alias_for_my_new_script", "mns"]
description = "a helpful description for using my new script"
command = "sh my_new_script.sh"
```

Now the script `my_new_script.sh` is ran with `quickscripts my_new_script`, or `quickscripts an_alias_for_my_new_script`, etc. 

Your script's description and its aliases are given when you write `quickscripts` with no arguments, along with a description for all your other scripts. If you only want the description of a particular script simply specify `quickscripts help my_new_script`. Doing so will also print any extra information mentioned a `description_more = "..."` config option (if one is given).

### Optional Script Configuration Options
* `description_more` - string - An extra block of text to be printed when `quickscripts help <SCRIPT_NAME>` is given the respective script's name.

## Install tomlplusplus
tomlplusplus is installed automatically when `setup.sh` is ran. Otherwise, you may manually install the [header](https://raw.githubusercontent.com/marzer/tomlplusplus/master/toml.hpp) the instructions below. For more information, see the [tomlplusplus GitHub page](https://github.com/marzer/tomlplusplus).

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

## This Project's [C++ Template](https://github.com/nickramsay19/cpp-cmake-catch2-project-template) Info
This project is built from my [C++ CMake Template](https://github.com/nickramsay19/cpp-cmake-catch2-project-template). To update the repository for when my template is updated, we must have a dedicated remote:
```sh
git remote add template git@github.com:nickramsay19/cpp-cmake-catch2-project-template.git
```
And to pull any updates, we do:
```sh
git fetch --all
git merge template/main --allow-unrelated-histories
```
