vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/TarsCpp
    REF 000a070a99d82740f2f238f2defbc2ee7ff3bf76
    SHA512 f5eb3c9b8647a8ee3467dbb54d7c8a8428227d92286483c78f40b64edfa08229fee01883de22ff3707650cde3063639acd2695685f1da7e152dfc7333414ba34
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DBUILD_SHARED_LIBS=OFF)
vcpkg_cmake_build()
vcpkg_cmake_install()