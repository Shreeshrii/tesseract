# use only with vcpkg.yml

cmake_minimum_required(VERSION 3.19)
project(cmaketest)

set_property(TARGET basicapitest PROPERTY CXX_STANDARD 17)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
set(LIB_pthread pthread)

find_package(Leptonica CONFIG REQUIRED)
find_package(Tesseract CONFIG REQUIRED)

add_executable( basicapitest basicapitest.cpp)

target_link_libraries(basicapitest ${Leptonica_LIBRARIES})
target_link_libraries(basicapitest libtesseract)
target_link_libraries(basicapitest stdc++fs) # need this if using g++ 8
