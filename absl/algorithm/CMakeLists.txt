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

file(GLOB ALGORITHM_PUBLIC_HEADERS "*.h")
file(GLOB ALGORITHM_INTERNAL_HEADERS "internal/*.h")


install(FILES ${ALGORITHM_PUBLIC_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/algorithm)
install(FILES ${ALGORITHM_INTERNAL_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/algorithm/internal)

#
## TESTS
#

# test algorithm_test
abseil_test(algorithm_test
    algorithm_test.cc
ADDITIONAL_HEADERS
    ${ALGORITHM_PUBLIC_HEADERS}
    ${ALGORITHM_INTERNAL_HEADERS}
)

abseil_test(container_test
    container_test.cc
)
