LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    qcamera_test.cpp \

LOCAL_SHARED_LIBRARIES:= \
    libdl \
    libui \
    libutils \
    libcutils \
    libbinder \
    libmedia \
    libui \
    libgui \
    libcamera_client \
    libskia \
    libstagefright \
    libstagefright_foundation \

ifneq ($(call is-platform-sdk-version-at-least,18),true)

LOCAL_SHARED_LIBRARIES += \
    libmedia_native \

LOCAL_CFLAGS += -DUSE_JB_MR1 -DCONFIG_WT88047_CAMERA

endif

LOCAL_C_INCLUDES += \
    frameworks/base/include/ui \
    frameworks/base/include/surfaceflinger \
    frameworks/base/include/camera \
    frameworks/base/include/media \
    external/skia/include/core \
    external/skia/include/images \
    $(call project-path-for,qcom-display)/libgralloc \
    frameworks/av/include/media/stagefright \
    frameworks/native/include/media/openmax \

LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_MODULE:= camera_test
LOCAL_32_BIT_ONLY := true
LOCAL_MODULE_TAGS:= tests

LOCAL_CFLAGS += -Wall -fno-short-enums -O0

include $(BUILD_EXECUTABLE)


