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

file(GLOB NUMERIC_PUBLIC_HEADERS "*.h")
file(GLOB NUMERIC_INTERNAL_HEADERS "internal/*.h")

# library 128
abseil_library(int128
    int128.cc
ADDITIONAL_HEADERS
    ${NUMERIC_PUBLIC_HEADERS}
    ${NUMERIC_INTERNAL_HEADERS}
)

install(FILES ${NUMERIC_PUBLIC_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/numeric)
install(FILES ${NUMERIC_INTERNAL_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/numeric/internal)

abseil_test(int128_test
    int128_test.cc
LINK_LIBS
    int128
    base
)



