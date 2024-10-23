vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/bcos-boostssl
    REF 4ef3b6578adbdd45146d9c65dadc1c5889523837
    SHA512 7602fdb80c43965ef9f8ba7741d42e6be425a02bf3b17a0d3c4dfb206fd2c0a1d0468861472b702795b750ebebaba719237a7e4cd7b47054a32b4ebd1fe3f1d5
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
    -DBUILD_STATIC=ON
    DISABLE_PARALLEL_CONFIGURE
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/bcos-boostssl)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
