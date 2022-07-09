vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/evmone
    REF a02948410f3a459c2751bb37543afbf364b07410
    SHA512 ee536de36146fcd19f2d25728672dddb9d47ab7dd80b6d9be0262b8437b8f9305a3cd1ae156eb011a03f72f35085c478f2ce8c097c1fc42297f99d497e0d6b50
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF -DHUNTER_ENABLED=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/evmone)
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)