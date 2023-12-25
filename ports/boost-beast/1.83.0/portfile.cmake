# Automatically generated by scripts/boost/generate-ports.ps1

# boost-beast compile error in clang-16
# https://github.com/boostorg/beast/issues/2661
# https://github.com/boostorg/beast/issues/2648
# https://github.com/boostorg/beast/commit/72c2eeb3980ed0dc530de9241e25b247517de018
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/beast
    REF boost-1.83.0
    SHA512 d79ab6eb972e2beff4751809b3038c816578d6ea10422eca89bb75652686315bc31579761982a098c100272320b0e36ba2b4b70c2d5d30d7f2aa9a1a60e78ec8
    HEAD_REF master
    PATCHES FixClangError.patch
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
