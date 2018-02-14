cmake_minimum_required (VERSION 2.6)
project(wrapped_class_example)

include(ExternalProject)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wno-deprecated-declarations")

# Adding customized cmake module for building boost
list(APPEND CMAKE_MODULE_PATH  "${CMAKE_SOURCE_DIR}/cmake/Modules/")

# Find default python libraries and interpreter
find_package(PythonInterp REQUIRED)
find_package(PythonLibs REQUIRED)
include(BuildBoost) # Custom module

message(STATUS "Boost_INCLUDE_DIR = " ${Boost_INCLUDE_DIR})

include_directories(${Boost_INCLUDE_DIR} ${PYTHON_INCLUDE_DIRS})
link_directories(${Boost_LIBRARY_DIR})

# Build and link the pylib module
add_library(test_lib SHARED test_lib.cpp test_class.cpp)
target_link_libraries(test_lib ${Boost_LIBRARIES} ${PYTHON_LIBRARIES})
add_dependencies(test_lib Boost)

# Tweaks the name of the library to match what Python expects
set_target_properties(test_lib PROPERTIES SUFFIX .so)
set_target_properties(test_lib PROPERTIES PREFIX "")


#add_executable(wrapped_class_example main.cpp test_class.cpp)
