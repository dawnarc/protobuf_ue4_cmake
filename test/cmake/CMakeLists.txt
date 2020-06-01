cmake_minimum_required(VERSION 3.10)

set(root_dir "../") 

FILE(GLOB_RECURSE generated_src ../src/*.cc)

set(cpp_files
  ${generated_src}
)

include_directories(${root_dir}/../src/${PROTOBUF_VERSION}/)

link_directories(${root_dir}/../install//${CMAKE_BUILD_TYPE}/)  

#set(cmake_runtime_output_directory ${root_dir}/install/)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ../../../install/${PROTOBUF_VERSION}/${CMAKE_BUILD_TYPE}/)

add_library(libtest STATIC ${cpp_files})

target_link_libraries(libtest libprotobuf)  


