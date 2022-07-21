vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/tikv-client-c
    REF 9e6c908fc11c67c410e42b770e96abaa28aaa6d8
    SHA512 4f349b1f81b8f521f82f2759b4dbe0fac0283686c015a3c1b8d69a59f9c24d8278df6fdd77b04ec09b81e2aeca6af354666df683ea437d7cc34a30a2baa4060f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)