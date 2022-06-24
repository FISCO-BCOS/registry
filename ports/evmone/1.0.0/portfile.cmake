vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/evmone
    REF 474af324b214c735848a7a75a55dddf56ce7b7dc
    SHA512 f5eb3c9b8647a8ee3467dbb54d7c8a8428227d92286483c78f40b64edfa08229fee01883de22ff3707650cde3063639acd2695685f1da7e152dfc7333414ba34
    HEAD_REF master
)
vcpkg_replace_string("${SOURCE_PATH}/lib/evmone/CMakeLists.txt" "# add_standalone_library" "add_standalone_library")

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/evmone)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)