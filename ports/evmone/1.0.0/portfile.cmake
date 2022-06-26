vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/evmone
    REF 474af324b214c735848a7a75a55dddf56ce7b7dc
    SHA512 9fa141fa7e19e7ff767b038c1347ee44dc69fda8f7d6b3ef398e609494833962f6250f169cfaa66ced94693caa4fa844d1fd63df7bc7a8926a1213dbf67d4afe
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/evmone)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)