#
# Copyright (C) The LineageOS Project
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

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a53x/a53x-vendor.mk)

# Inherit the proprietary files common tree
$(call inherit-product, device/samsung/s5e8825-common/common.mk)

DEVICE_PATH := device/samsung/a53x

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_board_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_board_info.xml \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/init.s5e8825.unify.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.s5e8825.unify.rc

# Nfc
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service.samsung

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-sec-vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor.conf

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Placeholders
EMPTY_PLACEHOLDER := $(DEVICE_PATH)/configs/placeholder

PRODUCT_COPY_FILES += \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/AP_AUDIO_SLSI.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/APDV_AUDIO_SLSI.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/calliope_sram.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/mfc_fw.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/os.checked.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/NPU.bin \
    $(EMPTY_PLACEHOLDER):$(TARGET_COPY_OUT_VENDOR)/firmware/vts.bin

# UDFPS
$(call soong_config_set,samsung_udfps,udfps_zorder,0x2000U)
$(call soong_config_set,surfaceflinger,udfps_lib,//hardware/samsung/fingerprint:libudfps_extension.samsung)

# Variant props
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/props/odm_a53x/odm_SM-A5360.prop:$(TARGET_COPY_OUT_ODM)/build_SM-A5360.prop \
    $(LOCAL_PATH)/configs/props/odm_a53x/odm_SM-A536B.prop:$(TARGET_COPY_OUT_ODM)/build_SM-A536B.prop \
		$(LOCAL_PATH)/configs/props/odm_a53x/odm_SM-A536E.prop:$(TARGET_COPY_OUT_ODM)/build_SM-A536E.prop \
    $(LOCAL_PATH)/configs/props/product_a53x/product_SM-A5360.prop:$(TARGET_COPY_OUT_PRODUCT)/build_SM-A5360.prop \
    $(LOCAL_PATH)/configs/props/product_a53x/product_SM-A536B.prop:$(TARGET_COPY_OUT_PRODUCT)/build_SM-A536B.prop \
		$(LOCAL_PATH)/configs/props/product_a53x/product_SM-A536E.prop:$(TARGET_COPY_OUT_PRODUCT)/build_SM-A536E.prop \
    $(LOCAL_PATH)/configs/props/system_a53x/system_SM-A5360.prop:$(TARGET_COPY_OUT_SYSTEM)/build_SM-A5360.prop \
    $(LOCAL_PATH)/configs/props/system_a53x/system_SM-A536B.prop:$(TARGET_COPY_OUT_SYSTEM)/build_SM-A536B.prop \
		$(LOCAL_PATH)/configs/props/system_a53x/system_SM-A536E.prop:$(TARGET_COPY_OUT_SYSTEM)/build_SM-A536E.prop \
    $(LOCAL_PATH)/configs/props/system_ext_a53x/system_ext_SM-A5360.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/build_SM-A5360.prop \
    $(LOCAL_PATH)/configs/props/system_ext_a53x/system_ext_SM-A536B.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/build_SM-A536B.prop \
		$(LOCAL_PATH)/configs/props/system_ext_a53x/system_ext_SM-A536E.prop:$(TARGET_COPY_OUT_SYSTEM_EXT)/build_SM-A536E.prop \
    $(LOCAL_PATH)/configs/props/vendor_a53x/vendor_SM-A5360.prop:$(TARGET_COPY_OUT_VENDOR)/build_SM-A5360.prop \
    $(LOCAL_PATH)/configs/props/vendor_a53x/vendor_SM-A536B.prop:$(TARGET_COPY_OUT_VENDOR)/build_SM-A536B.prop \
		$(LOCAL_PATH)/configs/props/vendor_a53x/vendor_SM-A536E.prop:$(TARGET_COPY_OUT_VENDOR)/build_SM-A536E.prop
