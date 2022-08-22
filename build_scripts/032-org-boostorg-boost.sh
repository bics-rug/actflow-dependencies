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
echo "# Boost"
cd $EDA_SRC/org-boostorg-boost
cp LICENSE_1_0.txt $ACT_HOME/license/LICENSE_org-boostorg-boost
# currently building without MPI (MPICH)
# echo "using mpi ;" >> user-config.jam
./bootstrap.sh --prefix=$ACT_HOME --without-libraries=python  || exit 1
# echo "using mpi ;" >> project-config.jam
./b2 -j2 install || exit 1
