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

file(GLOB SYNCHRONIZATION_PUBLIC_HEADERS "*.h")
file(GLOB SYNCHRONIZATION_INTERNAL_HEADERS "internal/*.h")


# syncrhonisation library
abseil_library(synchronization
    barrier.cc
    blocking_counter.cc
    internal/create_thread_identity.cc
    internal/per_thread_sem.cc
    internal/waiter.cc
    internal/graphcycles.cc
    notification.cc
    mutex.cc
ADDITIONAL_HEADERS
    ${SYNCHRONIZATION_PUBLIC_HEADERS}
    ${SYNCHRONIZATION_INTERNAL_HEADERS}
LINK_LIBS
    base
    malloc_extension
    time
)
install(FILES ${SYNCHRONIZATION_PUBLIC_HEADERS}
    DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/synchronization)
install(FILES ${SYNCHRONIZATION_INTERNAL_HEADERS}
    DESTINATION ${CMAKE_INSTALL_FULL_INCLUDEDIR}/absl/synchronization/internal)

#
## TESTS
#


# test barrier_test
abseil_library(barrier_test
    barrier_test.cc
LINK_LIBS
    synchronization
)
abseil_test(blocking_counter_test
    blocking_counter_test.cc
LINK_LIBS
    synchronization
)
abseil_test(graphcycles_test
    internal/graphcycles_test.cc
LINK_LIBS
    synchronization
)
abseil_test(mutex_test
    mutex_test.cc
LINK_LIBS
    synchronization
)
abseil_test(notification_test
    notification_test.cc
LINK_LIBS
    synchronization
)
abseil_test(per_thread_sem_test_common
    internal/per_thread_sem_test.cc
LINK_LIBS
    synchronization
    strings
)







