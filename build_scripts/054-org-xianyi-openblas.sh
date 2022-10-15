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
echo "# BLAS"

cd $EDA_SRC/org-xianyi-openblas
# license
cp LICENSE $ACT_HOME/license/LICENSE_org-xianyi-openblas
#if [ ! -d build ]; then
#	mkdir build
#fi
#cd $EDA_SRC/org-xianyi-openblas/build
#cmake \
#-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
#-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
#-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
#-D CMAKE_EXE_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
#-D CMAKE_SHARED_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
#-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
#-D CMAKE_BUILD_TYPE=Release \
#-D NUM_THREADS=64 \
#-D USE_OPENMP=1 \
#-D BUILD_STATIC_LIBS=ON \
#-D BUILD_SHARED_LIBS=ON \
#.. || exit 1
#sed -i 's/\/lib64/\/lib/g' cmake_install.cmake
#make -j || exit 1
#make install  || exit 1
make -j NUM_THREADS=64 USE_OPENMP=1 CPPFLAGS="-I$ACT_HOME/include ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib" || exit 1
make PREFIX=$ACT_HOME install  || exit 1
cd $ACT_HOME/lib/
ln -s libopenblas.so libblas.so
ln -s libopenblas.so liblapack.so

