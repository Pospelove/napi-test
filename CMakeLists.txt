cmake_minimum_required(VERSION 3.22)

set(CMAKE_TOOLCHAIN_FILE "C:/projects/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")

project(napi_test)

add_library(test SHARED addon.c addon_node.c addon.h)

# set extenson to .node
set_target_properties(test PROPERTIES SUFFIX ".node")

# find unofficial node-api package
find_package(unofficial-node-api CONFIG REQUIRED)

message("node-api_INCLUDE_DIR = ${node-api_INCLUDE_DIR}")

# link to unofficial node-api package
target_link_libraries(test PRIVATE unofficial::node-api::node-api)