LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	refnotify.c \

LOCAL_SHARED_LIBRARIES := \
    libhardware_legacy \
    libc \
    libutils \
    libcutils \
    liblog \

LOCAL_MODULE := refnotify

LOCAL_MODULE_TAGS := optional

LOCAL_PROPRIETARY_MODULE := true

LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
include $(BUILD_EXECUTABLE)
