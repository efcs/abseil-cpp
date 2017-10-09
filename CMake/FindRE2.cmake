#
# Copyright 2017 The Abseil Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include(FindPackageHandleStandardArgs)

set(RE2_FIND_REQUIRED TRUE)


find_path(RE2_INCLUDE_DIRS NAMES  re2.h PATH_SUFFIXES re2)
find_library(RE2_LIBRARIES NAMES re2 )

find_package_handle_standard_args(RE2 DEFAULT_MSG RE2_INCLUDE_DIRS RE2_LIBRARIES)

mark_as_advanced(RE2_FOUND RE2_INCLUDE_DIRS RE2_LIBRARIES)


