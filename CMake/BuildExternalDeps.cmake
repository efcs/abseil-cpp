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
include(ExternalProject)

if (NOT ABSL_BUILD_DEPS_FROM_SOURCE)
  message(FATAL_ERROR "This file should only be included when building external deps")
endif()

set(INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install-deps)

set(CCTZ_FOUND ON)
set(CCTZ_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/google-cctz)
set(CCTZ_LIBRARIES ${INSTALL_PREFIX}/lib/libcctz.a)
set(CCTZ_INCLUDE_DIRS ${INSTALL_PREFIX}/include)
string(REPLACE "-std=" "" STD_VER "${ABSL_STD_CXX_FLAG}")
ExternalProject_Add(google-cctz
        PREFIX google-cctz
        SOURCE_DIR ${CCTZ_PREFIX}/src
        BINARY_DIR ${CCTZ_PREFIX}/build
        STAMP_DIR ${CCTZ_PREFIX}/stamp
        INSTALL_DIR ${INSTALL_PREFIX}
        GIT_REPOSITORY https://github.com/google/cctz.git
        CONFIGURE_COMMAND ""
        BUILD_ALWAYS ON
        BUILD_COMMAND
          make -C <BINARY_DIR>
          -f <SOURCE_DIR>/Makefile
          SRC=<SOURCE_DIR>/
          CXX=${CMAKE_CXX_COMPILER}
          STD=${STD_VER}
        INSTALL_COMMAND
          make -C <BINARY_DIR>
          -f <SOURCE_DIR>/Makefile
          install
          SRC=<SOURCE_DIR>/
          CXX=${CMAKE_CXX_COMPILER}
          STD=${STD_VER}
          PREFIX=<INSTALL_DIR>
        )

set(GTEST_FOUND ON)
set(GMOCK_FOUND ON)
set(GTEST_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/google-test)
set(GTEST_LIBRARIES ${INSTALL_PREFIX}/lib/libgtest.a)
set(GMOCK_LIBRARIES ${INSTALL_PREFIX}/lib/libgmock.a)
set(GTEST_MAIN_LIBRARIES ${INSTALL_PREFIX}/lib/libgtest_main.a)
set(GTEST_INCLUDE_DIRS ${INSTALL_PREFIX}/include)
set(GMOCK_INCLUDE_DIRS ${INSTALL_PREFIX}/include)

ExternalProject_Add(google-test
          PREFIX google-test
          SOURCE_DIR ${GTEST_PREFIX}/src
          BINARY_DIR ${GTEST_PREFIX}/build
          INSTALL_DIR ${INSTALL_PREFIX}
          STAMP_DIR ${GTEST_PREFIX}/stamp
          GIT_REPOSITORY https://github.com/google/googletest.git
          CMAKE_CACHE_ARGS
            -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
          )

mark_as_advanced(GTEST_FOUND GTEST_INCLUDE_DIRS GTEST_LIBRARIES GTEST_MAIN_LIBRARIES)
mark_as_advanced(GMOCK_FOUND GMOCK_INCLUDE_DIRS GMOCK_LIBRARIES)
