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

file(GLOB STRINGS_PUBLIC_HEADERS "*.h")
file(GLOB STRINGS_INTERNAL_HEADERS "internal/*.h")


# add string library
abseil_library(strings
    ascii.cc
    escaping.cc
    internal/memutil.cc
    internal/memutil.h
    internal/utf8.cc
    match.cc
    numbers.cc
    str_cat.cc
    str_replace.cc
    str_split.cc
    string_view.cc
    substitute.cc
ADDITIONAL_HEADERS
    ${STRINGS_PUBLIC_HEADERS}
    ${STRINGS_INTERNAL_HEADERS}
LINK_LIBS
    base
    throw_delegate
)
install(FILES ${STRINGS_PUBLIC_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/strings)
install(FILES ${STRINGS_INTERNAL_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/strings/internal)

#
## TESTS
#

macro(strings_test Name)
  cmake_parse_arguments(ARG
      "INTERNAL"
      ""
      "LINK_LIBS"
  ${ARGN})
  set(source ${Name}.cc)
  if (${ARG_INTERNAL})
    set(source internal/${source})
  endif()
  abseil_test(${Name}
      ${source}
  LINK_LIBS
      strings
      ${ARG_LINK_LIBS})
endmacro()

strings_test(match_test)
strings_test(escaping_test LINK_LIBS base)
strings_test(ascii_test)
strings_test(memutil_test INTERNAL)
strings_test(utf8_test INTERNAL LINK_LIBS base)
strings_test(string_view_test LINK_LIBS throw_delegate base)
strings_test(substitute_test LINK_LIBS base)
strings_test(str_replace_test LINK_LIBS base throw_delegate)
strings_test(str_split_test LINK_LIBS base throw_delegate)
strings_test(ostringstream_test INTERNAL)
strings_test(resize_uninitialized_test INTERNAL)
strings_test(str_join_test)
strings_test(str_cat_test)
strings_test(numbers_test)
strings_test(strip_test)
strings_test(char_map_test INTERNAL)




