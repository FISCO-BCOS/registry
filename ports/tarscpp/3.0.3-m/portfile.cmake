vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/TarsCpp
    REF d4b0e82b13c6b8925ba6b0bc035e36fef2003c84
    SHA512 9d0e45cfa52ed776f9396af9ff5258f74b8a15492a277ade45ec026a3db16e5bf23bf0c7097231afedcecaf4a421f01af119b87ac54b4664421a7d753fcd7403
    HEAD_REF feature-namespace
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
