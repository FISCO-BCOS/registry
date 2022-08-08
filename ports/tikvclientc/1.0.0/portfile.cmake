vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/tikv-client-c
    REF e3bfeda00afd4238300d0c3a715d2422fab2a286
    SHA512 f17845c4bfe5880b1fba4249ff250f325d20114461649a796dcb162dccb1bae0fd72fb6473e00482cf9a289605e7a074c43c0314eb4e61310056125bd24cf0ec
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)