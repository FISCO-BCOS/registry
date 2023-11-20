vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO WeBankBlockchain/hsm-crypto
    REF de061fc70adac68e0a490905d26ed01e0cbbf5e8
    SHA512 54227b59118b57aa67f10b145ee927922f37b9e0535cc6318cf8525a74d723ddb5953a918a8183cf89a5c01c7dc0b4e752357e695d65f74f6ab0ee27acfdcd56
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/HSM-CRYPTO)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)