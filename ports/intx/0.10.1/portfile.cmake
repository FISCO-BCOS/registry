vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO chfast/intx
    REF 2ab1e8691e9d1eac3af34626556b6568ef961315
    SHA512 c7587b0ac3f49fa62216e7e9105ee4182c845c87dbafb78fbaa6252fa8aefe8e7596e9e9b93f5930c7f2db4df1fea1d529b365aaf38a124ade1311bcc2e9b18d
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DINTX_TESTING=OFF -DHUNTER_ENABLED=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/intx)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib" "${CURRENT_PACKAGES_DIR}/debug/lib")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)