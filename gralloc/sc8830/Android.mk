# 
# Copyright (C) 2010 ARM Limited. All rights reserved.
# 
# Copyright (C) 2008 The Android Open Source Project
#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# gralloc.sc8830 is NOT built from source on Android 9: it needs ump/ump_ref_drv.h (UMP), which is not in the
# tree, and it must match the vendor Mali blobs. The vendor blob lib/hw/gralloc.sc8830.so is used instead.
# Set SPRD_BUILD_GRALLOC_FROM_SOURCE := true to try the source module.
ifeq ($(SPRD_BUILD_GRALLOC_FROM_SOURCE),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_MODULE := gralloc.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS := optional

SHARED_MEM_LIBS := \
	libion_sprd \
	libhardware

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libcutils \
	libGLESv1_CM \
	$(SHARED_MEM_LIBS) \

LOCAL_C_INCLUDES := \
	$(TOP)/hardware/sprd/kernel-headers/video/ \
	$(TOP)/hardware/sprd/kernel-headers \
	$(TOP)/hardware/sprd/kernel-headers \

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	$(LOCAL_PATH) \
	$(LOCAL_C_INCLUDES) \

LOCAL_CFLAGS := \
	-DLOG_TAG=\"gralloc.$(TARGET_BOARD_PLATFORM)\" \

ifeq ($(strip $(USE_UI_OVERLAY)),true)
LOCAL_CFLAGS += -DUSE_UI_OVERLAY
endif

ifneq ($(strip $(TARGET_BUILD_VARIANT)),user)
LOCAL_CFLAGS += -DDUMP_FB
endif

ifeq ($(USE_SPRD_DITHER),true)
LOCAL_CFLAGS += -DSPRD_DITHER_ENABLE
LOCAL_SHARED_LIBRARIES += libdither
endif

LOCAL_SRC_FILES := \
	gralloc_module.cpp \
	alloc_device.cpp \
	framebuffer_device.cpp \
	dump_bmp.cpp \

#LOCAL_CFLAGS+= -DMALI_VSYNC_EVENT_REPORT_ENABLE
LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
LOCAL_CFLAGS += -include $(TOP)/hardware/sprd/sprd_hal_compat.h
include $(BUILD_SHARED_LIBRARY)


endif

# Header-only library used by omx_components/* and hwcomposer (defined only for scx15 in the
# original repo, but sc8830 modules reference libgralloc_headers_$(TARGET_BOARD_PLATFORM)).
# LOCAL_PATH must be set here: the assignment further up lives inside the (disabled) gralloc source block.
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := libgralloc_headers_$(TARGET_BOARD_PLATFORM)
LOCAL_EXPORT_C_INCLUDE_DIRS := \
	$(LOCAL_PATH) \
	$(TOP)/hardware/sprd/kernel-headers \
	$(TOP)/hardware/sprd/kernel-headers/video
include $(BUILD_HEADER_LIBRARY)
