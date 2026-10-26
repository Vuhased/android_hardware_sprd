# Copyright 2006 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_C_INCLUDES := \
    hardware/ril/include

LOCAL_SRC_FILES:= \
    secril-client.cpp

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libbinder \
    libcutils \
    libhardware_legacy \
    liblog

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)

LOCAL_PROPRIETARY_MODULE := true

LOCAL_MODULE:= libsecril-client

LOCAL_PRELINK_MODULE := false

LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
include $(BUILD_SHARED_LIBRARY)
