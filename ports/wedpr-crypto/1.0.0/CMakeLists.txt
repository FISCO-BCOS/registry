cmake_minimum_required(VERSION 3.20)
project(wedprcrypto)

include(FindPackageHandleStandardArgs)
include(ExternalProject)
include(GNUInstallDirs)

set(WEDPR_CRYPTO_HEADERS "${SOURCE_PATH}/third_party/include")
set(WEDPR_CRYPTO_crypto_LIBRARIES "${SOURCE_PATH}/target/release/${CMAKE_STATIC_LIBRARY_PREFIX}ffi_c_crypto_binary${CMAKE_STATIC_LIBRARY_SUFFIX}")
set(WEDPR_CRYPTO_fisco-bcos_LIBRARIES "${SOURCE_PATH}/target/release/${CMAKE_STATIC_LIBRARY_PREFIX}ffi_c_fisco_bcos${CMAKE_STATIC_LIBRARY_SUFFIX}")

ExternalProject_Add(wedpr-crypto
  SOURCE_DIR "${SOURCE_PATH}"
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  BUILD_BYPRODUCTS ${WEDPR_CRYPTO_crypto_LIBRARIES} ${WEDPR_CRYPTO_fisco-bcos_LIBRARIES}
  COMMAND ${CARGO_BIN} +nightly-2021-06-17 build --release
    --features "wedpr_f_hash_keccak256 wedpr_f_signature_secp256k1 wedpr_f_signature_sm2 wedpr_f_hash_sm3 wedpr_f_vrf_curve25519 wedpr_f_crypto_block_cipher_aes wedpr_f_crypto_block_cipher_sm4 wedpr_f_hash_ripemd160 wedpr_f_hash_sha2 wedpr_f_hash_sha3 wedpr_f_hash_blake2b wedpr_f_signature_ed25519"
    --no-default-features --manifest-path ${SOURCE_PATH}/ffi/ffi_c/ffi_c_crypto_binary/Cargo.toml
  COMMAND ${CARGO_BIN} +nightly-2021-06-17 build --release
    --manifest-path ${SOURCE_PATH}/ffi/ffi_c/ffi_c_fisco_bcos/Cargo.toml
  INSTALL_COMMAND ""
)

set(WEDPR_CRYPTO_INCLUDE_DIRS "${WEDPR_CRYPTO_INSTALL}/include/")

include(GNUInstallDirs)
install(FILES "${WEDPR_CRYPTO_crypto_LIBRARIES}" DESTINATION "${CMAKE_INSTALL_LIBDIR}")
install(FILES "${WEDPR_CRYPTO_fisco-bcos_LIBRARIES}" DESTINATION "${CMAKE_INSTALL_LIBDIR}")

file(GLOB_RECURSE HEADERS ${WEDPR_CRYPTO_HEADERS}/*.h)
install(FILES ${HEADERS} DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/wedpr-crypto/")