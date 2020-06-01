cmake_minimum_required(VERSION 3.10)

set(protobuf_source_dir "../")  

set(libprotobuf_files
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/any.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/any.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/api.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/compiler/importer.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/compiler/parser.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/descriptor.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/descriptor.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/descriptor_database.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/duration.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/dynamic_message.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/empty.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/extension_set_heavy.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/field_mask.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/generated_message_reflection.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/generated_message_table_driven.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/io/gzip_stream.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/io/printer.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/io/tokenizer.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/map_field.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/message.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/reflection_ops.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/service.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/source_context.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/struct.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/stubs/substitute.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/text_format.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/timestamp.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/type.pb.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/unknown_field_set.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/delimited_message_util.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/field_comparator.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/field_mask_util.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/datapiece.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/default_value_objectwriter.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/error_listener.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/field_mask_utility.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/json_escaping.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/json_objectwriter.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/json_stream_parser.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/object_writer.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/proto_writer.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/protostream_objectsource.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/protostream_objectwriter.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/type_info.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/type_info_test_helper.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/internal/utility.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/json_util.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/message_differencer.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/time_util.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/util/type_resolver_util.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/wire_format.cc
	${protobuf_source_dir}/src/${PROTOBUF_VERSION}/google/protobuf/wrappers.pb.cc
)

include_directories(${protobuf_source_dir}/src/${PROTOBUF_VERSION}/)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ../../../install/${PROTOBUF_VERSION}/${CMAKE_BUILD_TYPE}/)

add_library(libprotobuf STATIC ${libprotobuf_files} )

