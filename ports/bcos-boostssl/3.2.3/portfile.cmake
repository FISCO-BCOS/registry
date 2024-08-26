vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cyjseagull/bcos-boostssl
    REF e82f32cefe10738a87682afd3686a1ce646aa926
    SHA512 c6ffe4f4a62013bdf9387035e17aff4e204783cb1f664291f74d20500a47db113c07785d524cf1d5ef319787c510a4dde14d3b442d61a382d7ad65d8bae168d8
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/bcos-boostssl)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
