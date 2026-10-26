/*
 * Compatibility definitions for the SPRD HAL code (hwcomposer, omx, shims) on Android 9.
 *
 * The old SPRD-patched system/graphics.h and hardware/gralloc.h defined a few vendor pixel
 * formats and gralloc usage bits that AOSP/LineageOS 16 no longer have. Values are the same as
 * in gralloc/scx15/gralloc_priv.h and do not collide with anything in Android 9.
 * Included with -include from the Android.mk of the affected modules.
 */
#ifndef SPRD_HAL_COMPAT_H
#define SPRD_HAL_COMPAT_H

#ifndef HAL_PIXEL_FORMAT_YCbCr_420_P
#define HAL_PIXEL_FORMAT_YCbCr_420_P    0x13
#endif
#ifndef HAL_PIXEL_FORMAT_YCbCr_420_SP
#define HAL_PIXEL_FORMAT_YCbCr_420_SP   0x19
#endif
#ifndef HAL_PIXEL_FORMAT_RGBA_5551
#define HAL_PIXEL_FORMAT_RGBA_5551      6
#endif
#ifndef HAL_PIXEL_FORMAT_RGBA_4444
#define HAL_PIXEL_FORMAT_RGBA_4444      7
#endif

#ifndef GRALLOC_USAGE_OVERLAY_BUFFER
#define GRALLOC_USAGE_OVERLAY_BUFFER    0x01000000U
#endif
#ifndef GRALLOC_USAGE_VIDEO_BUFFER
#define GRALLOC_USAGE_VIDEO_BUFFER      0x02000000U
#endif
#ifndef GRALLOC_USAGE_CAMERA_BUFFER
#define GRALLOC_USAGE_CAMERA_BUFFER     0x04000000U
#endif

#endif /* SPRD_HAL_COMPAT_H */
