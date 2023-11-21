vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO FISCO-BCOS/FISCO-BCOS
        REF 1b2510ad6bc089ee7a0718d4cf581cfe32b97a52
        SHA512 85c8cda9bca3eaadeb4bec8c8a552f99fe8b44a15daa87c0c2c21751918a199131f732e6ad3020b8bbf0ec7a2abd9b3a1c22a6f2f255d52b3c6213ffdc79fb55
        HEAD_REF feature-3.6.0
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -DALLOCATOR=default
        -DTESTS=OFF
        -DWITH_TIKV=OFF
        -DWITH_TARS_SERVICES=OFF
        -DWITH_LIGHTNODE=OFF
        -DWITH_CPPSDK=ON
        -DBUILD_STATIC=OFF
        -DTOOLS=OFF
        -DFULLNODE=OFF
        -DWITH_WASM=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"  RENAME copyright)