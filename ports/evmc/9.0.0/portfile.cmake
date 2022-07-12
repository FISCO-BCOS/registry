vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/evmc
    REF 309b7242ca0b1667aea7faaa8720fc9195b5a233
    SHA512 aa6786c3d4e155890dbacfff51b2aefaca724317c98616edce9babbaf7b1971af56cb927e22c6119d375d5deed34c1486bbe8c7a0a75f08a916a9029ee6349d4
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF -DEVMC_TESTING=OFF -DEVMC_TOOLS=OFF -DHUNTER_ENABLED=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/evmc)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)