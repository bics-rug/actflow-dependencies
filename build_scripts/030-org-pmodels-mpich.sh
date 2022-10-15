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

# => boost
# => trilinos (xyce => actsim)
# => galois (backend tools)

echo 
echo "#### MPICH ####"
echo

cd $EDA_SRC/org-pmodels-mpich
cp COPYRIGHT $ACT_HOME/license/LICENSE_org-pmodels-mpich

# very bad hack => patching old version numbers:
sed -i 's/ver=2.4.4/ver=2.4.2/' autogen.sh
sed -i 's/ver=1.15/ver=1.13/' autogen.sh

./autogen.sh
./configure \
    --prefix=$ACT_HOME \
    --enable-fast=O3 \
    FFLAGS=-fallow-argument-mismatch \
    FCFLAGS=-fallow-argument-mismatch || exit 1
make -j2 || exit 1
make install || exit 1

