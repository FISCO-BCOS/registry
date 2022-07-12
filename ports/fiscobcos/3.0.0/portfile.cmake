vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO morebtcg/FISCO-BCOS-1
    REF d1a118a599bffff2d96e15c5869f0defd0d2e3a4
    SHA512 0686338c60516939b92c3007b3fb3dc86c410e00bbb056560ce8380f0043ae5c2e6ae06f24c01b9efb3961e2814a96a27cd5189484b7d1c45ab5736b984c4913
    HEAD_REF feature-3.0.0
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
      "fullnode"     FULLNODE
      "lightnode"    WITH_LIGHTNODE
      "etcd"         WITH_ETCD
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS ${FEATURE_OPTIONS})
vcpkg_cmake_build()
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)