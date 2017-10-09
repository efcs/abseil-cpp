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


function(abseil_library Name)
    string(TOUPPER ${Name} UPPER_NAME)

    add_library(${Name} STATIC ${${UPPER_NAME}_SRC})

    target_compile_options(${Name} PRIVATE ${ABSL_COMPILE_CXXFLAGS} )
    target_link_libraries(${Name} ${${UPPER_NAME}_PUBLIC_LIBRARIES})



    if(NOT ${${UPPER_NAME}_DISABLE_INSTALL})
        install(TARGETS ${Name}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR}
        )
    endif()

endfunction()


function(abseil_test Name)
    string(TOUPPER ${Name} UPPER_NAME)

    add_executable(${Name}_bin ${${UPPER_NAME}_SRC})

    target_compile_options(${Name}_bin PRIVATE ${ABSL_COMPILE_CXXFLAGS} ${${UPPER_NAME}_PRIVATE_COMPILE_FLAGS})
    target_link_libraries(${Name}_bin ${${UPPER_NAME}_PUBLIC_LIBRARIES} ${ABSL_TEST_COMMON_LIBRARIES})


    add_test(${Name}_test ${Name}_bin)


endfunction()




