{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = [
    pkgs.ascii-image-converter
    pkgs.llvmPackages_15.clang
    pkgs.llvmPackages_15.compiler-rt
    pkgs.llvmPackages_15.libcxx
    pkgs.llvmPackages_15.libclang
    pkgs.llvmPackages_15.libcxxabi
    pkgs.llvmPackages_15.libunwind
    pkgs.llvmPackages_15.lld
    pkgs.zlib.dev
    pkgs.openssl
    pkgs.pkg-config
    (import (fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz") { }).stable.toolchain
  ];

  enterShell = ''
    export C_INCLUDE_PATH=$C_INCLUDE_PATH:$DEVENV_PROFILE/lib/clang/15.0.7/include
    ascii-image-converter book/theme/favicon.png -C -W 60
  '';

  devcontainer.enable = true;
}
