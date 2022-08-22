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

if [ x$ACT_HOME = x ]
then
	echo "Please set the environment variable ACT_HOME to the install directory"
        exit 1
fi

echo "#############################"
echo "# test all binaries"
if [ -d "../packaging" ]; then echo "please exec from repository root (one folder up)"; exit 1; fi 

mv $ACT_HOME ${ACT_HOME}_test
export ACT_HOME=${ACT_HOME}_test

bash test
