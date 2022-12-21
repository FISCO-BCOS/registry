vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/evmone
    REF 9edbc1dcf53abf45299dafbbcffade2d5a594972
    SHA512 94f8a57efe982951ad86c3389cb4fe47edb7064a7e8c015f9030cd08428de287ba1db6131125bda5f753da96b76170ba84d86557247272c2c70a7066768029c3
    HEAD_REF master
    PATCHES "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt.patch"
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF -DEVMONE_FUZZING=OFF -DHUNTER_ENABLED=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/evmone)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)