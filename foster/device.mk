#
# Copyright (C) 2014 The CyanogenMod Project
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

$(call inherit-product, device/nvidia/shield-common/shield.mk)
$(call inherit-product, 3rdparty/google/gms-apps/tv/gms.mk)
$(call inherit-product-if-exists, frameworks/base/data/videos/VideoPackage2.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/t210/nvflash.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/touch/raydium.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/touch/sharp.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/touch/nvtouch.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/multimedia/base.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/multimedia/firmware.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/camera/full.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/services/nvcpl.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/core/android/services/analyzer.mk)
$(call inherit-product, vendor/nvidia/tegra/core/android/services/edid.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/core/android/t124/full.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/core/nvidia-tegra-vendor.mk)
$(call inherit-product, vendor/nvidia/shieldtech/common/shieldtech.mk)

# Include drawables for various densities.
PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

PRODUCT_CHARACTERISTICS := tv
TARGET_TEGRA_VERSION := t124

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_PROPERTY_OVERRIDES += \
        ro.nrdp.modelgroup=SHIELDANDROIDTV

# Define Netflix nrdp properties
PRODUCT_COPY_FILES += $(LOCAL_PATH)/nrdp.modelgroup.xml:system/etc/permissions/nrdp.modelgroup.xml

# Boot Animation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayouts/AliTV_Remote_V1_Airmouse.kl:system/usr/keylayout/AliTV_Remote_V1_Airmouse.kl \
    $(LOCAL_PATH)/keylayouts/AliTV_Remote_V1_Airmouse.idc:system/usr/idc/AliTV_Remote_V1_Airmouse.idc \
    $(LOCAL_PATH)/keylayouts/ADT-1_Remote.kl::system/usr/keylayout/ADT-1_Remote.kl

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    device/nvidia/foster/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    busybox \
    fstab.jetson-tk1 \
    init.recovery.jetson-tk1.rc \
    init.jetson-tk1.rc \
    init.jetson-tk1_common.rc \
    power.jetson-tk1.rc \
    ueventd.jetson-tk1.rc

# Permissions
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
     frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
     frameworks/native/data/etc/android.software.device_admin.xml:system/etc/permissions/android.software.device_admin.xml \
     frameworks/native/data/etc/android.software.managed_users.xml:system/etc/permissions/android.software.managed_users.xml

# NVIDIA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.xml:system/etc/permissions/com.nvidia.feature.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.feature.opengl4.xml:system/etc/permissions/com.nvidia.feature.opengl4.xml \
    $(LOCAL_PATH)/permissions/com.nvidia.nvsi.xml:system/etc/permissions/com.nvidia.nvsi.xml

# Media config
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/audio/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/audio/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/audio/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/audio/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/comms/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    $(LOCAL_PATH)/firmware/BCM20702A0-0a5c-21e8.hcd:system/etc/firmware/brcm/BCM20702A0-0a5c-21e8.hcd \
    $(LOCAL_PATH)/firmware/BCM2045A0-13d3-3488.hcd:system/etc/firmware/brcm/BCM2045A0-13d3-3488.hcd

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/comms/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/firmware/fw_bcmdhd_56.bin:system/vendor/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/firmware/nvram.txt:system/etc/nvram.txt

# Leanback Launcher
PRODUCT_PACKAGES += \
    AppDrawer \
    LeanbackLauncher \
    LeanbackCustomize \
    LeanbackIme \
    Provision \
    TvProvider \
    TvSettings \
    tv_input.default \
    TV
