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
echo "# numactl"
cd $EDA_SRC/org-numactl-numactl
./autogen.sh || exit 1
./configure --prefix=$ACT_HOME CPPFLAGS="-I$ACT_HOME/include -I$ACT_HOME/include/ncurses ${CPPFLAGS}" LDFLAGS="-L$ACT_HOME/lib ${LDFLAGS} -Wl,-rpath=\\\$\$ORIGIN/../lib,-rpath=$ACT_HOME/lib" || exit 1
make -j || exit 1
make install || exit 1
cp LICENSE.GPL2 $ACT_HOME/license/LICENSE_org-numactl-numactl
cat LICENSE.LGPL2.1 >> $ACT_HOME/license/LICENSE_org-numactl-numactl

