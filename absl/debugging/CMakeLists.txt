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

file(GLOB DEBUGGING_PUBLIC_HEADERS "*.h")
file(GLOB DEBUGGING_INTERNAL_HEADERS "internal/*.h")

list(APPEND STACKTRACE_SRC
    "stacktrace.cc"
    "internal/address_is_readable.cc"
    "internal/elf_mem_image.cc"
    "internal/vdso_support.cc"
    ${DEBUGGING_PUBLIC_HEADERS}
    ${DEBUGGING_INTERNAL_HEADERS}
)

abseil_library(stacktrace)


install(FILES ${DEBUGGING_PUBLIC_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/debugging)
install(FILES ${DEBUGGING_INTERNAL_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/debugging/internal)
