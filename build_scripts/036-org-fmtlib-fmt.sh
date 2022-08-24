#!/bin/bash

#
# Copyright 2022 Ole Richter - University of Groningen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

echo "#############################"
echo "# fmt"
cd $EDA_SRC/org-fmtlib-fmt
cp LISENCE.rst $ACT_HOME/license/LICENSE_org-fmtlib-fmt

if [ ! -d build ]; then
	mkdir build
fi
cd $EDA_SRC/org-fmtlib-fmt/build
cmake \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_POSITION_INDEPENDENT_CODE=TRUE \
-D BUILD_SHARED_LIBS=TRUE \
-D CMAKE_EXE_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_SHARED_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
 .. || exit 1
sed -i 's/\/lib64/\/lib/g' cmake_install.cmake
make -j || exit 1
make install || exit 1
