vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO morebtcg/FISCO-BCOS-1
    REF 33dabf104954cfbc3d9f5f9f80887190ae071209
    SHA512 46ecc0a89e988d4efdbd3a06fb2c038e824403c1742d07d9409df6dba158bb9e23687a6396995fb425ebf8d970044b5a2ce40281b98e7ad53eb27a0394365fdd
    HEAD_REF feature-3.0.0
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
      "fullnode"     FULLNODE
      "lightnode"    WITH_LIGHTNODE
      "etcd"         WITH_ETCD
      "tarsservices" WITH_TARS_SERVICES
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS ${FEATURE_OPTIONS})
vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)