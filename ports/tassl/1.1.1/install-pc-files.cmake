function(install_pc_file name pc_data)
    if(NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "release")
        configure_file("${CMAKE_CURRENT_LIST_DIR}/tassl.pc.in" "${CURRENT_PACKAGES_DIR}/lib/pkgconfig/${name}.pc" @ONLY)
    endif()
    if(NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "debug")
        configure_file("${CMAKE_CURRENT_LIST_DIR}/tassl.pc.in" "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig/${name}.pc" @ONLY)
    endif()
endfunction()

install_pc_file(tassl [[
Name: TASSL
Description: Secure Sockets Layer and cryptography libraries and tools
Requires: libssl libcrypto
]])

install_pc_file(libssl [[
Name: TASSL-libssl
Description: Secure Sockets Layer and cryptography libraries
Libs: -L"${libdir}" -llibssl
Requires: libcrypto
Cflags: -I"${includedir}"
]])

install_pc_file(libcrypto [[
Name: TASSL-libcrypto
Description: OpenSSL cryptography library
Libs: -L"${libdir}" -llibcrypto
Libs.private: -lcrypt32 -lws2_32
Cflags: -I"${includedir}"
]])

vcpkg_fixup_pkgconfig()
