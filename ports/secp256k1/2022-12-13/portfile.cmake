vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bitcoin-core/secp256k1
    REF 21ffe4b22a9683cf24ae0763359e401d1284cc7a
    SHA512 2d1f450d912aad9ac38ddad6bdc3ce8f029a58d0265e276a26fdd01d518bf374dd2bd1b3b2b124566e12ceeb9e2106cc8f909fe0b982ea391dbfc88fc37c7dd6
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        tools       BUILD_TOOLS
        examples    BUILD_EXAMPLES
        external-callbacks    USE_EXTERNAL_DEFAULT_CALLBACKS
)

vcpkg_cmake_configure(
	SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
	OPTIONS_DEBUG
        -DINSTALL_HEADERS=OFF
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(CONFIG_PATH "share/unofficial-${PORT}" PACKAGE_NAME unofficial-${PORT})

if (BUILD_TOOLS OR BUILD_EXAMPLES)
    set(SECP256K1_TOOLS "")
    if (BUILD_TOOLS)
        list(APPEND SECP256K1_TOOLS bench bench_internal bench_ecmult)
    endif()

    if (BUILD_EXAMPLES)
        list(APPEND SECP256K1_TOOLS ecdsa_example ecdh_example schnorr_example)
    endif()

    vcpkg_copy_tools(TOOL_NAMES ${SECP256K1_TOOLS} AUTO_CLEAN)
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
