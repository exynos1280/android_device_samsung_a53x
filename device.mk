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

# Inherit proprietary files
$(call inherit-product, vendor/samsung/a53x/a53x-vendor.mk)

# Inherit common makefile
$(call inherit-product, device/samsung/s5e8825-common/common.mk)

# Inherit Dalvik VM configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

DEVICE_PATH := device/samsung/a53x

# Audio - Configuration
PRODUCT_PACKAGES += \
    audio_board_info.xml \
    mixer_gains.xml \
    mixer_paths.xml

# Fingerprint - Sensor
PRODUCT_PACKAGES += sensors.samsung

# Init
PRODUCT_PACKAGES += \
    init.a53x.rc \
    init.a53x.unify.rc

# NFC
PRODUCT_PACKAGES += android.hardware.nfc@1.2-service.samsung

# NFC - Configuration
PRODUCT_PACKAGES += \
    libese-nxp.conf \
    libnfc-nci.conf \
    libnfc-nxp.conf \
    libnfc-nxp_RF.conf \
    libnfc-sec-vendor.conf

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# UDFPS
$(call soong_config_set,samsung_udfps,udfps_zorder,0x2000U)
$(call soong_config_set,surfaceflinger,udfps_lib,//hardware/samsung/fingerprint:libudfps_extension.samsung)
