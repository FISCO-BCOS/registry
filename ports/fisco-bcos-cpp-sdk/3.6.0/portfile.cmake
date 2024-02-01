vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO FISCO-BCOS/FISCO-BCOS
        REF c2364086e2b47f0b279509c178c641759f09d261
        SHA512 8f56080852965a5b4d98bd6e85f9f2b26cbdc1558a9ecde971ff291684bb616072e1f0605b05a0feafde890c471cc65f476129afda3a6448167617275ae590b4
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