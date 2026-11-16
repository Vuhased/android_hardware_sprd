LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	SPRDAVCEncoder.cpp \
	rgb2yuv_neon.s

LOCAL_C_INCLUDES := \
	frameworks/av/media/libstagefright/include \
	frameworks/native/include/media/openmax \
	frameworks/native/include/media/hardware \
	frameworks/native/include \
	$(LOCAL_PATH)/../../../../../gralloc/$(TARGET_BOARD_PLATFORM) \
	$(TOP)/hardware/sprd/kernel-headers \
	$(TOP)/hardware/sprd/kernel-headers/video


LOCAL_CFLAGS := \
	-DOSCL_EXPORT_REF= \
	-DOSCL_IMPORT_REF=

LOCAL_LDFLAGS += -Wl,--no-warn-shared-textrel

LOCAL_ARM_MODE := arm

LOCAL_SHARED_LIBRARIES := \
	libstagefright \
	libstagefright_omx \
	libstagefright_foundation \
	libstagefrighthw \
	libmemoryheapion_sprd \
	libutils \
	libui \
	libdl \
	liblog

LOCAL_MODULE := libstagefright_sprd_h264enc
LOCAL_MODULE_TAGS := optional

ifeq ($(strip $(TARGET_BOARD_CAMERA_ANTI_SHAKE)),true)
LOCAL_CFLAGS += -DANTI_SHAKE
endif

LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
LOCAL_CFLAGS += -include $(TOP)/hardware/sprd/sprd_hal_compat.h
include $(BUILD_SHARED_LIBRARY)
