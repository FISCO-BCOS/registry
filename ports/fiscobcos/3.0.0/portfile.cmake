vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/FISCO-BCOS
    REF 1aa2d828c36b9e7a8210addc3db9e9060ef6b48c
    SHA512 d93f003880cbc45eecf68c9afc76a24b739f154acb49376839cd7b92ce27a3db13a59a97c9faa2711355ad24b051b2ce3f1c60523cad71c889a9066cc04b631c
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