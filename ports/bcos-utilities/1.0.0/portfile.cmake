vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/bcos-utilities
    REF 5a931ffb716e7d3042ba845cf439a9c8b7609bd3
    SHA512 267eae6140f47b273b0b41c862ea0f227ae1f8dd0f16ef1b12d40ed175cdea616d71228287e19aa58ac38c54c6fe3f8f69a131176099eda512bd1850b0e1a986
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_STATIC=ON
)

vcpkg_cmake_build()
vcpkg_cmake_install()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"  RENAME copyright)