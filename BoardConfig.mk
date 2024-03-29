#
# Copyright (C) 2017-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#


# 32-bit
FORCE_32_BIT := true

# Inherit from msm8916-common
include device/cyanogen/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/oppo/A37

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bionic //Low Memory Device
MALLOC_SVELTE := true

# Camera
BOARD_GLOBAL_CFLAGS += -DCONFIG_OPPO_CAMERA_51
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
    
# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 126877696
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2859466752
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11632902144
TARGET_OTA_ASSERT_DEVICE := a37f,A37f,A37fw,a37fw,msm8916,msm8939

# GPS
TARGET_NO_RPC := true


# Init
TARGET_INIT_VENDOR_LIB := libinit_a37
TARGET_RECOVERY_DEVICE_MODULES := libinit_a37

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_SOURCE := kernel/oppo/msm8939
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_ARCH := arm64
TARGET_CUSTOM_DTBTOOL := dtbToolOppo
TARGET_KERNEL_CONFIG := lineageos_a37f_defconfig

# LMKD stats logging
TARGET_LMKD_STATS_LOG := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
BOARD_NO_SECURE_DISCARD := true

# Security Patch Level
VENDOR_SECURITY_PATCH := 2016-09-01

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/vendor/lib/libmmcamera2_stats_modules.so|libshim_camera.so \
    /system/vendor/lib/libmmcamera2_stats_algorithm.so|libcamera_shim.so \
    /system/vendor/lib/hw/camera.vendor.msm8916.so|libshim_camera.so 


# TWRP
ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/twrp.mk
endif

# Widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# Wi-Fi
TARGET_PROVIDES_WCNSS_QMI := true

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/power_supply/battery/charging_enabled
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_ENABLED := 1
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_DISABLED := 0

include vendor/oppo/A37/BoardConfigVendor.mk
