cmake_minimum_required(VERSION 3.19)
project(cmaketest)

find_package( Leptonica  REQUIRED )
find_package( Tesseract REQUIRED )

add_executable( basicapitest basicapitest.cpp)
target_link_libraries(basicapitest PRIVATE Tesseract::libtesseract)
