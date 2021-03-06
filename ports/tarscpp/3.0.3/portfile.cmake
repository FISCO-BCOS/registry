vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/TarsCpp
    REF 5249a356a790a033e5a109e1cf6523f59d89e587
    SHA512 915cc58002739560e1e31d3b5ab72c21e322c772ca37f1728623a000d8b4f48da5e3f1b90d3cb230b8f51c5049130a27981d13d9c70cd7710bee71da01e0ee03
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DTARS_MYSQL=OFF
    DISABLE_PARALLEL_CONFIGURE
)

vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)