TARGET_PLATFORM := android-7
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_ARM_MODE := arm
LOCAL_MODULE := App2
LOCAL_SRC_FILES += Wrappers.cpp
LOCAL_ARM_MODE := arm
COMMON_CFLAGS := -Werror -DANDROID -DDISABLE_IMPORTGL -isystem $(SYSROOT)/usr/include
ifeq ($(TARGET_ARCH),x86)
	LOCAL_CFLAGS := $(COMMON_CFLAGS)
else
	LOCAL_CFLAGS := -mfloat-abi=softfp -fno-short-enums $(COMMON_CFLAGS)
endif
LOCAL_LDLIBS := -llog -lGLESv2 -Wl,-s
LOCAL_CPPFLAGS += -std=gnu++0x
include $(BUILD_SHARED_LIBRARY)
APP_OPTIM := release
APP_PLATFORM := android-7
APP_STL := gnustl_static
APP_CPPFLAGS += -frtti
APP_CPPFLAGS += -fexceptions
APP_CPPFLAGS += -DANDROID
APP_ABI := armeabi-v7a
APP_MODULES := App2
NDK_TOOLCHAIN_VERSION := clang
