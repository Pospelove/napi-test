cmake_minimum_required(VERSION 3.22)

if(WIN32)
  set(CMAKE_TOOLCHAIN_FILE "C:/projects/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")
elseif(APPLE)
  set(CMAKE_TOOLCHAIN_FILE "/Users/leonidpospelov/projects/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")
else()
  set(CMAKE_TOOLCHAIN_FILE "/usr/src/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")
endif()

project(napi_test)

add_library(test SHARED addon.c addon_node.c addon.h)

# set extenson to .node
set_target_properties(test PROPERTIES SUFFIX ".node" PREFIX "")

# find unofficial node-api package
find_package(unofficial-node-api CONFIG REQUIRED)

message("node-api_INCLUDE_DIR = ${node-api_INCLUDE_DIR}")

# link to unofficial node-api package
target_link_libraries(test PRIVATE unofficial::node-api::node-api)