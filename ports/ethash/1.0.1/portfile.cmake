vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO chfast/ethash
    REF 8e18c3d715d3d759f44ac10f70f9c93b227e18c2
    SHA512 4f305071f49c3520e9a7d0cec8ee4aa2291eb0fea540b59617eff61ac28b1d8ef9c04f58dc57847f05edf6bf838186771b6a194a8e13f088f6084e0eced5fdce
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DETHASH_BUILD_ETHASH=OFF -DETHASH_BUILD_TESTS=OFF -DHUNTER_ENABLED=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/ethash)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)