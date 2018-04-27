cmake_minimum_required(VERSION 3.10)

set(root_dir "../")  

set(cpp_files
  ${root_dir}/src/test.pb.cc
)

include_directories(${root_dir}/../src/)

link_directories(${root_dir}/../install//${CMAKE_BUILD_TYPE}/)  

#set(cmake_runtime_output_directory ${root_dir}/install/)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ../../../install/${CMAKE_BUILD_TYPE}/)

add_library(libtest STATIC ${cpp_files})

target_link_libraries(libtest libprotobuf-lite)  


