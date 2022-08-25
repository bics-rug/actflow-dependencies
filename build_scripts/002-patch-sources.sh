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

# disabled support for lzma in boost iostreams

#echo "Applying patch to xz library..."
#if [ ! -f patched_dependencies_v1 ]
#then
#   (cd src/org-tukaani-xz; 
#     patch -p0 < ../../extra/org-tukaani-xz-liblzma-compat-libs.patch;
#   )
#   touch patched_dependencies_v1
#fi