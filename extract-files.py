#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)
from extract_utils.fixups_lib import (
    lib_fixups_user_type,
)

namespace_imports = [
    'device/samsung/s5e8825-common',
    'hardware/samsung',
    'hardware/samsung_slsi-linaro/exynos',
    'hardware/samsung_slsi-linaro/graphics',
    'hardware/samsung_slsi-linaro/interfaces',
    'vendor/samsung/s5e8825-common',
]


def lib_fixup_device_dep(lib: str, *_):
    return f'//device/samsung/s5e8825-common/shims/stub:{lib}'


lib_fixups: lib_fixups_user_type = {
    'libexynoscamera3': lib_fixup_device_dep,
}  # fmt: skip


blob_fixups: blob_fixups_user_type = {
    # Camera
    'vendor/lib64/libexynoscamera3.so': blob_fixup()
        .add_needed('libshim_camera.so')
        .binary_regex_replace(b'_ZN7android5Fence', b'_ZN7exynos55Fence'),
    # NFC
    'vendor/lib64/nfc_nci_nxpsn.so': blob_fixup()
        .add_needed('libbase_shim.so')
}  # fmt: skip

module = ExtractUtilsModule(
    'a53x',
    'samsung',
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 's5e8825-common', module.vendor
    )
    utils.run()
