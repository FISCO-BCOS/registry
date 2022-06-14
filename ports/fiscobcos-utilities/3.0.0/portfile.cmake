vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO morebtcg/FISCO-BCOS-1
    REF 5ec5090d7ef4d13e37694c8b6579c74914e8e7a7
    SHA512 cc10aa5006980d02be59a0ea541b991d1a754efb2d8b0fd6a9611d7e8d790d87dd188823b78d0d3cf32ac13d712465cb04bf1d238e1c7845c97acab7d091b004
    HEAD_REF feature-3.0.0
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DALL_COMPONENTS=OFF -DUTILITIES=ON)
vcpkg_cmake_build()
vcpkg_cmake_install()