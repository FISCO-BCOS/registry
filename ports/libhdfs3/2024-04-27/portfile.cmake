vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cyjseagull/libhdfs3
    REF d8ca0d140cac59d32aee515975c13dc972412daf
    SHA512 e5a0b0f699b61934680fd6d654e856f157ea9db62cb21be4adf15ca29133e2a81ff19465793e9016f8ce6243a283e3e34a895a23ff80355f81819aa5450b5cfa
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
