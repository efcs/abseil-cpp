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
    cmake_parse_arguments(ARG
        ""
        "INSTALL"
        "ADDITIONAL_HEADERS;DEPENDS;LINK_LIBS;COMPILE_FLAGS"
        ${ARGN})
    string(TOUPPER ${Name} UPPER_NAME)
    set(sources ${ARG_UNPARSED_ARGUMENTS} ${ARG_ADDITIONAL_HEADERS})
    add_library(${Name} STATIC ${sources})
    if (ARG_DEPENDS)
     add_dependencies(${Name} ${ARG_DEPENDS})
    endif()
    target_compile_options(${Name} PRIVATE ${ABSL_COMPILE_CXXFLAGS} )
    target_link_libraries(${Name} ${ARG_LINK_LIBS})

    if(${ARG_INSTALL})
        install(TARGETS ${Name}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR}
            LIBRARY DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR}
        )
    endif()
endfunction()


function(abseil_test Name)
    cmake_parse_arguments(ARG
        ""
        ""
        "ADDITIONAL_HEADERS;DEPENDS;LINK_LIBS;COMPILE_FLAGS"
        ${ARGN})
    string(TOUPPER ${Name} UPPER_NAME)
    set(sources ${ARG_UNPARSED_ARGUMENTS} ${ARG_ADDITIONAL_HEADERS})
    add_executable(${Name}_bin ${sources})
    add_dependencies(${Name}_bin google-test ${ARG_DEPENDS})
    target_compile_options(${Name}_bin
      PRIVATE
        ${ABSL_COMPILE_CXXFLAGS} ${ARG_COMPILE_FLAGS})
    target_link_libraries(${Name}_bin
        ${ARG_LINK_LIBS} ${ABSL_TEST_COMMON_LIBRARIES})

    add_test(${Name}_test ${Name}_bin)
endfunction()




