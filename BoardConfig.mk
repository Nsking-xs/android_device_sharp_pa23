
LOCAL_PATH := device/sharp/PA23

# inherit from the proprietary version
-include vendor/sharp/PA23/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8974
TARGET_BOARD_PLATFORM := msm8974
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := generic
TARGET_HARDWARE := qcom
ARCH_ARM_HAVE_TLS_REGISTER := true

# kernel
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 maxcpus=2 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --second_offset 0x00f00000 --tags_offset 0x01e00000

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/sharp/msm8974
TARGET_KERNEL_CONFIG := pa23_defconfig
KERNEL_TOOLCHAIN_PREFIX := arm-linux-androideabi-

# Filesystem
# Use signed boot and TARGET_BOOTIMG_SIGNEDrecovery image
TARGET_BOOTIMG_SIGNED                := false
TARGET_USERIMAGES_USE_EXT4           := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE    := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE       := 17825792
BOARD_RECOVERYIMAGE_PARTITION_SIZE   := 26214400
BOARD_SYSTEMIMAGE_PARTITION_SIZE     := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE   := 12549357568
BOARD_CACHEIMAGE_PARTITION_SIZE      := 281018368
BOARD_PERSISTIMAGE_PARTITION_SIZE    := 33554432
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE               := 131072

# Recovery
RECOVERY_FSTAB_VERSION             := 2
TARGET_RECOVERY_FSTAB              := $(LOCAL_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT       := "RGBX_8888"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"

# TWRP
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
DEVICE_RESOLUTION := 1080x1920
RECOVERY_VARIANT := twrp
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TW_EXCLUDE_MTP := true
TW_EXCLUDE_SUPERSU := true
TW_NO_USB_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
#TW_TARGET_USES_QCOM_BSP := true

#
USE_CAMERA_STUB := true

# SELinux policies
# qcom sepolicy
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
        $(LOCAL_PATH)/sepolicy

# Hack for building without kernel sources
#$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
