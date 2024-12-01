vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/libhdfs3
    REF 86bf0b95856416096a054a4d65b465aed918757d
    SHA512 0f84c85ee9025b232c92af22f89920f9cea55c410af289209e879b721dd2a7f56d5c84cd263f0ff156d123cb7350e54fc63766cf56ad5ebe4dbb75ac28b917b8
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
