LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	SoftSPRDMPEG4.cpp

LOCAL_CFLAGS := \
	-DOSCL_EXPORT_REF= \
	-DOSCL_IMPORT_REF=

LOCAL_ARM_MODE := arm

LOCAL_SHARED_LIBRARIES := \
	libmedia_omx \
	libstagefright_omx \
	libstagefright_foundation \
	libstagefrighthw \
	libmemoryheapion_sprd \
	libutils \
	libdl \
	liblog \

LOCAL_MODULE := libstagefright_sprd_soft_mpeg4dec
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true

LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
include $(BUILD_SHARED_LIBRARY)
