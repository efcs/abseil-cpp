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

file(GLOB TYPES_PUBLIC_HEADERS "*.h")

abseil_library(bad_any_cast
    bad_any_cast.cc
ADDITIONAL_HEADERS
    ${TYPE_PUBLIC_HEADERS}
LINK_LIBS
    base
)

abseil_library(optional
    optional.cc
LINK_LIBS
    base
)
abseil_library(bad_optional_access
    bad_optional_access.cc
LINK_LIBS
    base
)

install(FILES ${TYPES_PUBLIC_HEADERS}
        DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/types)


#
## TESTS
#

if (OFF)
# test any_test
set(ANY_TEST_SRC "any_test.cc")
set(ANY_TEST_PUBLIC_LIBRARIES base throw_delegate bad_any_cast test_instance_tracker_lib)

abseil_test(any_test
    any_test.cc
LINK_LIBS
    base
    throw_delegate
    bad_any_cast
    test_instance_tracker_lib
)

# test span_test
set(SPAN_TEST_SRC "span_test.cc")
set(SPAN_TEST_PUBLIC_LIBRARIES base strings throw_delegate bad_any_cast test_instance_tracker_lib)

abseil_test(span_test)


# test span_test_noexceptions
set(SPAN_TEST_NOEXCEPTIONS_SRC "span_test.cc")
set(SPAN_TEST_NOEXCEPTIONSPUBLIC_LIBRARIES base throw_delegate bad_any_cast test_instance_tracker_lib)



# test optional_test
set(OPTIONAL_TEST_SRC "optional_test.cc")
set(OPTIONAL_TEST_PUBLIC_LIBRARIES base throw_delegate optional bad_optional_access)

abseil_test(optional_test)


endif()
