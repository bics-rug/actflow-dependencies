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

make -j NUM_THREADS=64  || exit 1
make PREFIX=$ACT_HOME install  || exit 1
cd $ACT_HOME/lib/
ln -s libopenblas.so libblas.so
ln -s libopenblas.so liblapack.so

