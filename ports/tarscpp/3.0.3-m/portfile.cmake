vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/TarsCpp
    REF 9baa9a9cd2b8b463e33c5d1bb391d6f7f833d009
    SHA512 aca88c6286f0e02c66769078955cf04feb9dd83d21e9baa1efd7322e79b863709ebb017f25a470bd17220c67d879ff27d168a5e1bd2a0fa15b25b93cd98587ea
    HEAD_REF feature-namespace
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DTARS_MYSQL=OFF
    DISABLE_PARALLEL_CONFIGURE
)

vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
