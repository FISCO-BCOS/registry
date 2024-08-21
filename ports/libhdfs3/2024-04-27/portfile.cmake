vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/libhdfs3
    REF f91dff1e2f08f110475e7ab14579fba31cf92ee5
    SHA512 479ba61a48b479103d6561b1fd92719041248e02f137622577d1bfaf282522fc736325e3eb2135e6268a9a557d9520598c06e6e0b4fa70228fd574f93117d3a3
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
