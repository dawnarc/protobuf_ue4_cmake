

LOCAL_PATH := $(call my-dir)  
include $(CLEAR_VARS)  
CC_LITE_SRC_FILES := 										\
google/protobuf/arena.cc                                    \
google/protobuf/arenastring.cc                              \
google/protobuf/extension_set.cc                            \
google/protobuf/generated_message_table_driven_lite.cc      \
google/protobuf/generated_message_util.cc                   \
google/protobuf/io/coded_stream.cc                          \
google/protobuf/io/zero_copy_stream.cc                      \
google/protobuf/io/zero_copy_stream_impl_lite.cc            \
google/protobuf/message_lite.cc                             \
google/protobuf/repeated_field.cc                           \
google/protobuf/stubs/atomicops_internals_x86_gcc.cc        \
google/protobuf/stubs/atomicops_internals_x86_msvc.cc       \
google/protobuf/stubs/bytestream.cc                         \
google/protobuf/stubs/common.cc                             \
google/protobuf/stubs/int128.cc                             \
google/protobuf/stubs/io_win32.cc                           \
google/protobuf/stubs/once.cc                               \
google/protobuf/stubs/status.cc                             \
google/protobuf/stubs/statusor.cc                           \
google/protobuf/stubs/stringpiece.cc                        \
google/protobuf/stubs/stringprintf.cc                       \
google/protobuf/stubs/structurally_valid.cc                 \
google/protobuf/stubs/strutil.cc                            \
google/protobuf/stubs/time.cc                               \
google/protobuf/wire_format_lite.cc

  
# C++ full library  
# =======================================================  
#include $(CLEAR_VARS)  
  
LOCAL_MODULE := libprotobuf-lite-ndk
LOCAL_MODULE_TAGS := optional  
  
LOCAL_CPP_EXTENSION := .cc  
  
LOCAL_SRC_FILES += \
$(CC_LITE_SRC_FILES)                                         
  
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -DGOOGLE_PROTOBUF_NO_RTTI     #-DGOOGLE_PROTOBUF_NO_RTTI  
LOCAL_CFLAGS += -std=gnu++11

include $(BUILD_STATIC_LIBRARY)  