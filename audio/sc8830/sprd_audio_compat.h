/*
 * Compatibility definitions for the SPRD audio HAL on Android 9.
 * The SPRD tree used extra FM audio device types that do not exist in AOSP.
 * Values are in unused bits of audio_devices_t for Android 9.
 */
#ifndef SPRD_AUDIO_COMPAT_H
#define SPRD_AUDIO_COMPAT_H
#include <system/audio.h>

#ifndef AUDIO_DEVICE_OUT_FM_HEADSET
#define AUDIO_DEVICE_OUT_FM_HEADSET 0x10000000u
#endif
#ifndef AUDIO_DEVICE_OUT_FM_SPEAKER
#define AUDIO_DEVICE_OUT_FM_SPEAKER 0x20000000u
#endif
#ifndef AUDIO_DEVICE_OUT_ALL_FM
#define AUDIO_DEVICE_OUT_ALL_FM (AUDIO_DEVICE_OUT_FM_HEADSET | AUDIO_DEVICE_OUT_FM_SPEAKER)
#endif
#ifndef AUDIO_DEVICE_IN_LINE_IN
#define AUDIO_DEVICE_IN_LINE_IN AUDIO_DEVICE_IN_LINE
#endif
#endif
