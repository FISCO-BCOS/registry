vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/tikv-client-c
    REF c6ffeec25c2994d9d16adf6b14d97cd964d325d1
    SHA512 905e5194dcdcc3d9773e74bb1a14cc3e928e8e0a87034204245fc774d91f4b648101b7b7377731368d8c6803bb88ef23c6201372bba893116c7710efe20414e9
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)