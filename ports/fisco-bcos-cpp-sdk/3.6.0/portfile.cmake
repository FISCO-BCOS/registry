vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO FISCO-BCOS/FISCO-BCOS
        REF 148f72cafc4e675242d43b2a74c81e66db569a9f
        SHA512 eebbf33e38f726865654130da85bf5f0633016e3062eef7be4d4cf509b8cf783659f6b9380c2febaa5026a63447964273253c19b8542c579135da16ee250db85
        HEAD_REF release-3.6.0
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