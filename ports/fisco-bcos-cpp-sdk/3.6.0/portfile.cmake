vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO kyonRay/FISCO-BCOS
        REF 390784d196b456d143dd363f2aec0b04639ffbb5
        SHA512 6bb29decf8d446543bff9200d069aa8c8b6fa0a4b2c4bd23989781016ee8b2bd0e6a5ba064a65ba09ea0c08880b862196b2cc388cbcaf953f264be04ea80137a
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