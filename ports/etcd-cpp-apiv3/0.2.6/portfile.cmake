vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/etcd-cpp-apiv3
    REF c3babb85454e45f5ff12f56274f768d2dcce2bb7
    SHA512 bde4e4202da302fbad1683c28e788aedd681590c16910b3f4fc893b7ee56113a62e3bec598d5bacdc3ce58336d94b70fcaa2a63ae02c1a7575ab9ff1fff5403d
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DBUILD_ETCD_TESTS=OFF
)
set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)
set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/etcd-cpp-api)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

vcpkg_copy_pdbs()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/etcd-cpp-apiv3 RENAME copyright)