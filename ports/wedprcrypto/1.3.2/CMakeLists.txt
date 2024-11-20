cmake_minimum_required(VERSION 3.20)
project(wedprcrypto)

include(ExternalProject)
include(GNUInstallDirs)

set(WEDPR_CRYPTO_INSTALL "${CMAKE_CURRENT_BINARY_DIR}/wedpr-crypto-install")
ExternalProject_Add(wedprcrypto
  SOURCE_DIR "${SOURCE_PATH}"
  CONFIGURE_COMMAND echo nightly-2024-02-25 > ${SOURCE_PATH}/rust-toolchain
  BUILD_COMMAND ""
  BUILD_BYPRODUCTS ${WEDPR_CRYPTO_crypto_LIBRARIES} ${WEDPR_CRYPTO_fisco-bcos_LIBRARIES}
  COMMAND cd ${SOURCE_PATH}
  COMMAND ${CARGO_BIN} --version
  COMMAND ${CARGO_BIN} build --release
    --features "wedpr_f_hash_keccak256 wedpr_f_signature_secp256k1 wedpr_f_signature_sm2 wedpr_f_hash_sm3 wedpr_f_vrf_curve25519 wedpr_f_vrf_secp256k1 wedpr_f_crypto_block_cipher_aes wedpr_f_crypto_block_cipher_sm4 wedpr_f_hash_ripemd160 wedpr_f_hash_sha2 wedpr_f_hash_sha3 wedpr_f_hash_blake2b wedpr_f_signature_ed25519"
    --no-default-features --manifest-path ${SOURCE_PATH}/ffi/ffi_c/ffi_c_crypto_binary/Cargo.toml
  COMMAND ${CARGO_BIN} build --release
    --manifest-path ${SOURCE_PATH}/ffi/ffi_c/ffi_c_fisco_bcos/Cargo.toml
  COMMAND ${CARGO_BIN} build --release
    --manifest-path ${SOURCE_PATH}/ffi/ffi_c/ffi_c_zkp/Cargo.toml
  INSTALL_COMMAND ""
  # INSTALL_COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_BINARY_DIR}/wedpr-crypto-prefix/src/wedpr-crypto/third_party/include" "${WEDPR_CRYPTO_INSTALL}/include/wedpr-crypto"
)

file(GLOB_RECURSE HEADERS ${SOURCE_PATH}/third_party/include/*.h)
# set(WEDPR_CRYPTO_INCLUDE_DIRS "${WEDPR_CRYPTO_INSTALL}/include/")
set(WEDPR_CRYPTO_crypto_LIBRARIES "${SOURCE_PATH}/target/release/${CMAKE_STATIC_LIBRARY_PREFIX}ffi_c_crypto_binary${CMAKE_STATIC_LIBRARY_SUFFIX}")
set(WEDPR_CRYPTO_fisco-bcos_LIBRARIES "${SOURCE_PATH}/target/release/${CMAKE_STATIC_LIBRARY_PREFIX}ffi_c_fisco_bcos${CMAKE_STATIC_LIBRARY_SUFFIX}")
set(WEDPR_CRYPTO_zkp_LIBRARIES "${SOURCE_PATH}/target/release/${CMAKE_STATIC_LIBRARY_PREFIX}ffi_c_zkp${CMAKE_STATIC_LIBRARY_SUFFIX}")

install(FILES ${HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/wedpr-crypto/)
install(FILES ${WEDPR_CRYPTO_crypto_LIBRARIES} ${WEDPR_CRYPTO_fisco-bcos_LIBRARIES} ${WEDPR_CRYPTO_zkp_LIBRARIES} DESTINATION ${CMAKE_INSTALL_LIBDIR})

include(CMakePackageConfigHelpers)
configure_package_config_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/wedprcrypto-config.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/wedprcrypto-config.cmake"
  INSTALL_DESTINATION "share/wedpr-crypto"
)

install(
  FILES "${CMAKE_CURRENT_BINARY_DIR}/wedprcrypto-config.cmake"
  DESTINATION "share/wedprcrypto"
)