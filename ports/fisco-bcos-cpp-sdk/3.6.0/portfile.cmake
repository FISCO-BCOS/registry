vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO FISCO-BCOS/FISCO-BCOS
        REF 090ce6c4033881c88feecccdefb430c4f064b4e4
        SHA512 0aa49a14ed76690370caa6dbdf36f383623edfd976b460d17556330ed8a501d9c331ffafbca75339c254e1564597f1d81e5b990d5f0ef8a9677e8d671235d00e
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