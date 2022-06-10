vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/evmc
    REF 2e8bc3a6fc9c3cdbf5440b329dcdf0753faee43c
    SHA512 778810e2a18a64bdfcf3acc54cf7b1f782293cf29a6f0b5182f5f295db23c6d03e24f20d87381781a8d0b2ed5c26deb93fc76700392ffe0bc679e3649ea82254
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/evmc)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
vcpkg_fixup_pkgconfig()