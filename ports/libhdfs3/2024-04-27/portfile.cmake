vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cyjseagull/libhdfs3
    REF 5f1c0b884ff39d9627928a1aa780f488aa15b5cd
    SHA512 a200053ae59c020d0ceba577cdb10ca5c3667b12564d7cd0e6ae1a0200ff439d30b942863da0c94f208d60d9f1ef48d9fe6e42f5f96c8d109ec28829da42bbb4
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
