vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/libhdfs3
    REF 17942eac7edc6e63d841bb83c2dc2e35ee4b5f1c
    SHA512 775795a045d8e8169d0c9e221acaec3e79c4a51d97967308d44a61560651c60b5bf09dcc0783eef8e35943cdb246e6f290d260ad133eef8cfb9d141deb8bc3b1
    HEAD_REF apache-rpc-9
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        "sse"   ENABLE_SSE
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DENABLE_BOOST=OFF
        -DENABLE_COVERAGE=OFF
        ${FEATURE_OPTIONS}
    DISABLE_PARALLEL_CONFIGURE 
)
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH /lib/cmake/libhdfs3)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
