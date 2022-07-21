vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/tikv-client-c
    REF 16f11eb43d8293fc9a63f2b33fdbb44dd21154fd
    SHA512 a7c6e59e7e20befd8be48781c79d8a4effba6e047cb155bf00692fe137e33fcce2e9ae465f8b77a752f7fa76a5e8b76043f8c906d3b45fbb621463b819d79dd8
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)