#========================================================#
# Build the Boost dependencies for the project using a specific version of python #
#========================================================#

#set(BoostVersion 1.63.0)
#set(BoostMD5 1c837ecd990bb022d07e7aab32b09847)

#set(BoostVersion 1.66.0)
#set(BoostMD5 b2dfbd6c717be4a7bb2d88018eaccf75)


#string(REGEX REPLACE "beta\\.([0-9])$" "beta\\1" BoostFolderName ${BoostVersion})
#string(REPLACE "." "_" BoostFolderName ${BoostFolderName})
#set(BoostFolderName boost_${BoostFolderName})
#
#ExternalProject_Add(Boost
#    PREFIX Boost
#    URL  http://sourceforge.net/projects/boost/files/boost/${BoostVersion}/${BoostFolderName}.tar.bz2/download
#    URL_MD5 ${BoostMD5}
#    CONFIGURE_COMMAND ./bootstrap.sh
#                                                        --with-libraries=python
#                                                        --with-python=${PYTHON_EXECUTABLE}
#    BUILD_COMMAND           ./b2 install
#                                                        variant=release
#                                                        link=static
#                                                        cxxflags='-fPIC'
#                                                        --prefix=${CMAKE_BINARY_DIR}/extern
#                                                        -d 0
#                                                        -j8
#    INSTALL_COMMAND ""
#    BUILD_IN_SOURCE 1
#    )
#
#set(Boost_LIBRARY_DIR ${CMAKE_BINARY_DIR}/extern/lib/ )
#set(Boost_INCLUDE_DIR ${CMAKE_BINARY_DIR}/extern/include/ )
#
#if(${PYTHON_VERSION_STRING} GREATER 3.0)
#  message(STATUS "Using Python3")
#  set(Boost_LIBRARIES -lboost_python3 -lboost_numpy)
#else()
#  message(STATUS "Using Python2")
#  set(Boost_LIBRARIES -lboost_python -lboost_numpy)
#endif()



set(BoostVersion 1.66.0)
set(BoostSHA256 5721818253e6a0989583192f96782c4a98eb6204965316df9f5ad75819225ca9)

string(REGEX REPLACE "beta\\.([0-9])$" "beta\\1" BoostFolderName ${BoostVersion})
string(REPLACE "." "_" BoostFolderName ${BoostFolderName})
set(BoostFolderName boost_${BoostFolderName})

ExternalProject_Add(Boost
    PREFIX Boost
    URL https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.bz2 
    URL_HASH SHA256=${BoostSHA256}
    CONFIGURE_COMMAND ./bootstrap.sh
                                                        --with-libraries=python
                                                        --with-python=${PYTHON_EXECUTABLE}
    BUILD_COMMAND           ./b2 install
                                                        variant=release
                                                        link=static
                                                        cxxflags='-fPIC'
                                                        --prefix=${CMAKE_BINARY_DIR}/extern
                                                        -d 0
                                                        -j8
    INSTALL_COMMAND ""
    BUILD_IN_SOURCE 1
    )

set(Boost_LIBRARY_DIR ${CMAKE_BINARY_DIR}/extern/lib/ )
set(Boost_INCLUDE_DIR ${CMAKE_BINARY_DIR}/extern/include/ )

if(${PYTHON_VERSION_STRING} GREATER 3.0)
  message(STATUS "Using Python3")
  set(Boost_LIBRARIES -lboost_python3 -lboost_numpy)
else()
  message(STATUS "Using Python2")
  set(Boost_LIBRARIES -lboost_python -lboost_numpy)
endif()
