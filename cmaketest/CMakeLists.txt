cmake_minimum_required(VERSION 3.19)
project(cmaketest)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
set(LIB_pthread pthread)

find_package(PkgConfig)
pkg_check_modules(Leptonica REQUIRED lept>=1.78)

find_package(Tesseract CONFIG REQUIRED)

add_executable( basicapitest basicapitest.cpp)
target_link_libraries(basicapitest ${Leptonica_LIBRARIES})
target_link_libraries(basicapitest libtesseract)
