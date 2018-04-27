LOCAL_PATH := $(call my-dir) 

include $(CLEAR_VARS)  

LOCAL_MODULE := libtest-ndk
LOCAL_MODULE_TAGS := optional  

LOCAL_CPP_EXTENSION := .cc  

#LOCAL_SRC_FILES += \
#$(CC_LITE_SRC_FILES)                                         

MY_CPP_LIST += $(wildcard $(LOCAL_PATH)/protoc_files/*.cc)
LOCAL_SRC_FILES += $(MY_CPP_LIST:$(LOCAL_PATH)/%=%)


LOCAL_CFLAGS := -D GOOGLE_PROTOBUF_NO_RTTI=1
LOCAL_CPPFLAGS := -std=c++11 -D HAVE_PTHREAD=1
LOCAL_C_INCLUDES = $(LOCAL_PATH)/android
LOCAL_C_INCLUDES += ${ANDROID_NDK}/sources/cxx-stl/gnu-        libstdc++/4.8/include
#LOCAL_LDLIBS += -lz -llog
LOCAL_EXPORT_LDLIBS += -lz
LOCAL_EXPORT_CFLAGS := $(LOCAL_CFLAGS)
LOCAL_EXPORT_CPPFLAGS := $(LOCAL_CPPFLAGS)
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)

LOCAL_C_INCLUDES += ../../src
LOCAL_STATIC_LIBRARIES += ../../ndk_build/obj/local/armeabi-v7a/libprotobuf-lite.a

#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)