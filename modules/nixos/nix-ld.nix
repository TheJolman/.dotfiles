{...}: {
  programs.nix-ld = {
    enable = true;
    # libraries = with pkgs; [
    # ];
  };
}
/*
Default List of libraries:
* zlib
* zstd
* stdenv.cc.cc
* curl
* openssl
* attr
* libssh
* bzip2
* libxml2
* acl
* libsodium
* util-linux
* xz
* systemd
*/

