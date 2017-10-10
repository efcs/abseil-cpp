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


file(GLOB UTILITY_PUBLIC_HEADERS "*.h")

abseil_library(utility
    utility.cc
ADDITIONAL_HEADERS
    ${UTILITY_PUBLIC_HEADERS}
)
install(FILES ${UTILITY_PUBLIC_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/utility)

abseil_test(utility_test
    utility_test.cc
LINK_LIBS
    utility
)



