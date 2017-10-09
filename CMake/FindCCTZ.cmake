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
include(ExternalProject)

if (ABSL_BUILD_DEPS_FROM_SOURCE)
set(CCTZ_FOUND ON)
set(CCTZ_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/google-cctz)
set(CCTZ_LIBRARIES ${CCTZ_PREFIX}/src/libcctz.a)
set(CCTZ_INCLUDE_DIRS ${CCTZ_PREFIX}/src/include)
ExternalProject_Add(google-cctz
        PREFIX google-cctz
        SOURCE_DIR ${CCTZ_PREFIX}/src
        STAMP_DIR ${CCTZ_PREFIX}/stamp
        GIT_REPOSITORY https://github.com/google/cctz.git
        CONFIGURE_COMMAND ""
        BUILD_ALWAYS ON
        BUILD_IN_SOURCE ON
        BUILD_COMMAND make
        BUILD_BYPRODUCTS ${CCTZ_LIBRARIES}
        INSTALL_COMMAND "")
else()

find_path(CCTZ_INCLUDE_DIRS NAMES  cctz/civil_time.h)
find_library(CCTZ_LIBRARIES NAMES cctz )
find_package_handle_standard_args(CCTZ DEFAULT_MSG CCTZ_INCLUDE_DIRS CCTZ_LIBRARIES)

endif()

mark_as_advanced(CCTZ_FOUND CCTZ_INCLUDE_DIRS CCTZ_LIBRARIES)


