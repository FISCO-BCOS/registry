vcpkg_download_distfile(
    ARCHIVE
    URLS "https://github.com/WeBankBlockchain/WeDPR-Lab-Crypto/archive/0e3ca8614808825da4f91acc51e1031a5184119e.tar.gz"
    FILENAME "wedpr-crypto.tar.gz"
    SHA512 c548e53033e334ab2b8f6c26d23389a2727e4ca9b17369bb90551e6e6b1689c28ee100efb82e44bd49cfa36ed7e5e6a2bc7c77e1b9efc35a18958c3b57a90293
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH MASTER_COPY_SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
    REF 1.0.0
)

set(VCPKG_POLICY_SKIP_ARCHITECTURE_CHECK enabled)
set(VCPKG_POLICY_SKIP_DUMPBIN_CHECKS enabled)

find_program(CARGO_BIN NAMES cargo REQUIRED PATHS "$ENV{USERPROFILE}\\.cargo\\bin")
message(STATUS "CARGO BIN: ${CARGO_BIN}")

vcpkg_cmake_configure(
    SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}"
    OPTIONS -DSOURCE_PATH=${MASTER_COPY_SOURCE_PATH} -DCARGO_BIN=${CARGO_BIN}
)

vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${MASTER_COPY_SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)