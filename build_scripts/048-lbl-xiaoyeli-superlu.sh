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
# 


echo 
echo "#### superlu ####"
echo

cd $EDA_SRC/lbl-xiaoyeli-superlu
if [ ! -d build ]; then
	mkdir build
fi
cp License.txt $ACT_HOME/license/LICENSE_lbl-xiaoyeli-superlu

cd $EDA_SRC/lbl-xiaoyeli-superlu_dist
if [ ! -d build ]; then
	mkdir build
fi
# license

cp License.txt >> $ACT_HOME/license/LICENSE_lbl-xiaoyeli-superlu_dist
cd $EDA_SRC/lbl-xiaoyeli-superlu/build

cmake \
-D CMAKE_EXE_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_SHARED_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
-D CMAKE_BUILD_TYPE=Release \
-D TPL_BLAS_LIBRARIES=
-D TPL_ENABLE_INTERNAL_BLASLIB=OFF
-D TPL_ENABLE_LAPACKLIB=ON
$EDA_SRC/lbl-xiaoyeli-superlu || exit 1

make -j || exit 1
make install || exit 1

cd $EDA_SRC/lbl-xiaoyeli-superlu_dist/build

cmake \
-D CMAKE_EXE_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_SHARED_LINKER_FLAGS=-Wl,-rpath,'$ORIGIN/../lib' \
-D CMAKE_INSTALL_PREFIX=$ACT_HOME \
-D CMAKE_LIBRARY_PATH=$ACT_HOME/lib \
-D CMAKE_INCLUDE_PATH=$ACT_HOME/include \
-D CMAKE_POSITION_INDEPENDENT_CODE=ON \
-D CMAKE_BUILD_TYPE=Release \
$EDA_SRC/lbl-xiaoyeli-superlu_dist  || exit 1

make -j || exit 1
make install || exit 1

