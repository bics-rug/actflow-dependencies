# actflow-dependencies
build all dependencies required by actflow

# How to Package and build 

## requirements:
if you build on an older OS your package is compatible with more target platforms, thats why the CI builds on centos7.2

you need gcc 9+, m4, make, autoconf, automake, bison, flex, libtool, python3, csh, patch, texinfo (see packaging/centos7_install_build_system.sh)

and for the GUI the development packages libX11(-dev/-devel), libGLU(-dev/-devel)

on centos7 just run `centos7_install_build_system.sh` and `centos7_install_build_system_gui.sh` to get your system ready

## environment variables

`$ACT_HOME` is pointing to the install path
`$EDA_SRC` is pointing to the folder containing the sources

on centos7 just `source packaging/centos7_ci_build_environment.sh` from the repository root to get them set up with act home in `/opt/act`.

## run the steps for building local

`./build` should do the trick after you have your buildsystem setup properly

`./test` runs the linker tests after the build+install

### relation to the toplevel build/clear/test
the scripts in packaging actually run the top level sripts for you

## run the steps for packaging

for running all the packaging steps in order simply execute on the root of the repo
`for script in packaging/0*.sh; do bash $script; done`
or run all the 00X-*****.sh script in assending order

### relation to the toplevel build/clear/test
the scripts in packaging actually run the top level sripts for you

## folder structure

- `src` contains all dependency sources
- `tests` contains all linkage test scripts and some application tests
- `packaging` contains the scripts for CI and packaging
- `build_scripts` contains all the build scripts for the dependencies

