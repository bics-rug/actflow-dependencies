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

if [ -d "../tests" ]; then echo "please exec from repository root (one folder up)"; exit 1; fi
echo 
echo "#### openblas test for linking errors ####"
echo
source tests/test_helper.sh

lookup_shared_library "libblas.so"
lookup_shared_library "liblapack.so"
lookup_shared_library "libopenblas.so"
