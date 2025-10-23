
#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common infinity stuff.
$(call inherit-product, vendor/voltage/config/common_full_phone.mk)

# Enable ADPF pipeline for UI performance
PRODUCT_PRODUCT_PROPERTIES += \
persist.vendor.power.adpf.enable=true \
ro.vendor.powerhal.adpf.enable=true

#gms
WITH_GMS := false

# VoltageOS Flags
EXTRA_UDFPS_ANIMATIONS := true
PERF_ANIM_OVERRIDE := true

# VoltageOS CPUSets
VOLTAGE_CPU_SMALL_CORES := 0,1,2,3
VOLTAGE_CPU_BIG_CORES := 4,5,6,7

VOLTAGE_ALL_CORES := 0-7
VOLTAGE_CPU_BG := 0-3
VOLTAGE_CPU_FG := 0-6
VOLTAGE_CPU_LIMIT_BG := 0-1
VOLTAGE_CPU_LIMIT_UI := 4-7
VOLTAGE_CPU_DISPLAY := 4-7

# Inherit from tetris device
$(call inherit-product, device/nothing/tetris/device.mk)

PRODUCT_NAME := voltage_tetris
PRODUCT_DEVICE := tetris
PRODUCT_BRAND := Nothing
PRODUCT_MANUFACTURER := Nothing
PRODUCT_MODEL := A015

PRODUCT_GMS_CLIENTID_BASE := android-nothing

DEVICE_CODENAME := tetris

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="Tetris 15 AP3A.240905.015.A2 2506092111 release-keys" \
    BuildFingerprint=Nothing/Tetris/Tetris:15/AP3A.240905.015.A2/2506092111:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)
