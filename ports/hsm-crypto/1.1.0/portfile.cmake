vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO WeBankBlockchain/hsm-crypto
    REF 516bd743a4bd72ffa5c1e17c39e250597f2afd8c
    SHA512 701adc2b9aa8eaf3a731ea796c466a72f3cb5bd725b2cba6f6395a694bfb648ffa882282c4ac8e8b1091989dbef26d71f652d71b0bffaf0ab807af2ce5e70178
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/HSM-CRYPTO)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)