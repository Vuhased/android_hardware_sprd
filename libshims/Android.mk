LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := ril_shim.cpp
LOCAL_SHARED_LIBRARIES := libbinder libcutils liblog
LOCAL_MODULE := libril_shim
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
LOCAL_CFLAGS += -include $(TOP)/hardware/sprd/sprd_hal_compat.h
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := gps_shim.cpp
LOCAL_SHARED_LIBRARIES := libbinder libgui libsensor
LOCAL_MODULE := libgps_shim
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
LOCAL_CFLAGS += -include $(TOP)/hardware/sprd/sprd_hal_compat.h
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := stagefright_shim.cpp
LOCAL_C_INCLUDES := \
    $(TOP)/frameworks/av/include \
    $(TOP)/frameworks/native/include/media/hardware \
    $(TOP)/frameworks/native/include/media/openmax \
    $(TOP)/hardware/sprd/gralloc/$(TARGET_BOARD_PLATFORM)
LOCAL_SHARED_LIBRARIES := \
    libcamera_client \
    libnativewindow \
    libstagefright \
    libstagefright_foundation \
    libstagefright_omx_utils \
    liblog
LOCAL_MODULE := libstagefright_shim
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
LOCAL_CFLAGS += -include $(TOP)/hardware/sprd/sprd_hal_compat.h
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := phoneserver_shim.cpp
LOCAL_SHARED_LIBRARIES := libdl liblog libcutils
LOCAL_MODULE := libphoneserver_shim
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_CFLAGS += -Wno-error -Wno-error=int-conversion -Wno-error=address -Wno-error=sequence-point -Wno-error=format-security -Wno-error=non-virtual-dtor -Wno-error=date-time
LOCAL_CFLAGS += -include $(TOP)/hardware/sprd/sprd_hal_compat.h
include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
