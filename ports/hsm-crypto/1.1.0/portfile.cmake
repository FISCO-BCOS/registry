vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO WeBankBlockchain/hsm-crypto
    REF 5d23a56283c845532bd7b346bad19cf23102149a
    SHA512 9b9e9b2ec08707480beb3fabf0c596c9afabad988adc9de7131503f15cb2481a02bea398eeb0dc350d94251e2c25aaecdd55e0a060cbfd58f36279a5fe4b093f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/HSM-CRYPTO)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)