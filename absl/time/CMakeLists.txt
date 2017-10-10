#
# Copyright 2017 The Abseil Authors.
#
# Licensed under the Apache License Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing software
# distributed under the License is distributed on an AS IS BASIS
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

file(GLOB TIME_PUBLIC_HEADERS *.h)
file(GLOB TIME_INTERNAL_HEADERS internal/*.h)

abseil_library(time
    time.cc
    clock.cc
    duration.cc
    format.cc
    ADDITIONAL_HEADERS
      ${TIME_PUBLIC_HEADERS}
      ${TIME_INTERNAL_HEADERS}
    LINK_LIBS
      base
      stacktrace
      int128
      ${CCTZ_LIBRARIES}
  DEPENDS
    google-cctz
)

#
## TESTS
#

# test time_test
abseil_test(time_test
    time_test.cc
    clock_test.cc
    duration_test.cc
    format_test.cc
    time_norm_test.cc
    time_test.cc
    time_zone_test.cc
    internal/test_util.cc
LINK_LIBS
    time
)
