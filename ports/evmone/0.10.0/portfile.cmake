vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/evmone
    REF 06a60709fe5d07a68a0d83c89f4034450742f912
    SHA512 bcc0cbd0cb44f134d1a849f04330c7eb748cec4f6b61b9f7d3b8c0442e1795aefe53b32c4d30ba86767aa05c711fa4f8d99f9126ed541dad8fd084f58fa83abd
    HEAD_REF master
    PATCHES "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt.patch"
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF -DEVMONE_FUZZING=OFF -DHUNTER_ENABLED=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/evmone)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)