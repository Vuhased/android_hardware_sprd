LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    modemd.c \
    modemd_vlx.c \
    modemd_sipc.c \

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    liblog \

ifeq ($(strip $(TARGET_USERIMAGES_USE_EXT4)),true)
LOCAL_CFLAGS += -DCONFIG_EMMC
endif

LOCAL_MODULE := modemd

LOCAL_MODULE_TAGS := optional

LOCAL_PROPRIETARY_MODULE := true

LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
include $(BUILD_EXECUTABLE)
