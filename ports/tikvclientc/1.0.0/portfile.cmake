vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/tikv-client-c
    REF adc2618187b3537377c899e719b207bb494ba508
    SHA512 be87fdecc190b698c36231077f87ad7a6a9d6d2d9f032b3d4c009e9084253ab3317d88dfb07c6009db463f22daf982ad10febe5152515c1a3e8e888dfea4d094
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)