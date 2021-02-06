cmake_minimum_required(VERSION 3.19)
project(cmaketest)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
set(LIB_pthread pthread)

find_package( OpenMP REQUIRED)
if(OPENMP_FOUND)
message("OPENMP FOUND")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
endif()

find_package(PkgConfig)
pkg_check_modules(Leptonica REQUIRED lept>=1.78)
pkg_check_modules(Tesseract REQUIRED tesseract )

add_executable( basicapitest basicapitest.cpp)
target_link_libraries(basicapitest ${Leptonica_LIBRARIES})
target_link_libraries(basicapitest ${Tesseract_LIBRARIES})
