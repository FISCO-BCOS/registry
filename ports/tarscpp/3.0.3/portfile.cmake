vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FISCO-BCOS/TarsCpp
    REF 5ef1e21daaf1e143e81be5c7560c879f76edf447
    SHA512 1becacf870d45eb1d14ba1fd05dea4abeb8736d07127b1dccb7715250dfb730f0490ab95eb0d207591666cce081a4e6f5c7a45e18f738b184a981e37a77ec783
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} GENERATOR "Unix Makefiles")
vcpkg_build_make()
vcpkg_cmake_install()