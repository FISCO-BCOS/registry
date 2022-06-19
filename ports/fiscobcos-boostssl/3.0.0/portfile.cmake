vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO morebtcg/FISCO-BCOS-1
    REF 23f8a4b4be69713c9de31f1e3691ecc5d72f9fbd
    SHA512 d71be8c5e29aa396ce7ea1313874bd72c4a1f900e7ef361dd52faeff3594a89f4fcb2a75f91bae82a7adeac1a576577658134f7a0aadd6969d58b99557a278cc
    HEAD_REF feature-3.0.0
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DALL_COMPONENTS=OFF -DBOOSTSSL=ON)
vcpkg_cmake_build()
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)