vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/bcos-boostssl
    REF 37784c5dcebcb65e6d98eddf463197dde0ea7501
    SHA512 398cb6bd93ca30efd2fef14f9754ed6cce15bc275ec47a4d8270c46be6dda41ab75b2fcdee66561a5d052f4f6621bb547a2b56ec0a6a31cf4f87278ab705cf73
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
)

vcpkg_cmake_build()
vcpkg_cmake_install()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"  RENAME copyright)
