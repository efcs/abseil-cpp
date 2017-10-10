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

abseil_test(any_test
    any_test.cc
LINK_LIBS
    base
    throw_delegate
    bad_any_cast
    test_instance_tracker_lib
)
abseil_test(span_test
    span_test.cc
LINK_LIBS
    base
    strings
    throw_delegate
    bad_any_cast
    test_instance_tracker_lib
)
abseil_test(optional_test
    optional_test.cc
LINK_LIBS
    base
    throw_delegate
    optional
    bad_optional_access
)
