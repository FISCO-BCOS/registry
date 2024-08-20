vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/libhdfs3
    REF 04fc37a6aa38455b517c3a7c56951b7c6b6e001c
    SHA512 e2adca439b77c515c24b6a1280e45a601ceee038ae2fc415d1bc5e4ba8bff4473763a82fe7dc88059d4b10d30943a5f8e1f206efa7d4017adc07dbc0f9324aa2
    HEAD_REF apache-rpc-9
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/libhdfs3)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
