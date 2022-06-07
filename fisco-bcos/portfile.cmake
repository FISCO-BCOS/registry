vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO morebtcg/FISCO-BCOS
    REF 81388b71307ab8a27ba26123b7e6bf6515a2170a
    SHA512 0bd6095d647530d4cb1f509eb5e99965a25cc3dd9b8125b93abd6b248255c890cf20710154bdec40568478eb5c4cde724abfb2eff1f3a04e63acef0fbbc9799b
    HEAD_REF feature-3.0.0
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
# file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/libogg" RENAME copyright)