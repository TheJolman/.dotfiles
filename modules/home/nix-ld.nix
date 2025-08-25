{
  # lib,
  # pkgs,
  ...
}: {
  # home.sessionVariables = {
  #   # NIX_LD = lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
  #   NIX_LD = "${pkgs.stdenv.cc.bintools.dynamicLinker}";
  #   # LD_DEBUG = "libs";
  #   NIX_LD_LIBRARY_PATH = lib.makeLibraryPath (with pkgs; [
  #     # Basic system libs
  #     stdenv.cc.cc
  #     openssl
  #
  #     # Graphics and X11 libs
  #     xorg.libX11
  #     xorg.libXcomposite
  #     xorg.libXrandr
  #     xorg.libXrender
  #     xorg.libXext
  #     xorg.libXfixes
  #     xorg.libXtst
  #     xorg.libXi
  #     xorg.libXcursor
  #     xorg.libxcb
  #
  #     # Audio libraries
  #     alsa-lib
  #
  #     # Network and SSL libraries
  #     openssl
  #     openssl.out
  #     networkmanager
  #     libsecret
  #     webkitgtk_6_0
  #     curl
  #     curl.out
  #     nghttp2
  #     libsoup_3
  #     krb5
  #     pulseaudio
  #
  #     # Common system libraries
  #     zlib
  #     glib
  #     glib.out
  #     glib.bin
  #     gobject-introspection
  #     gtk3
  #     cairo
  #     pango
  #     atk
  #     at-spi2-core
  #     at-spi2-atk
  #     freetype
  #     fontconfig
  #     dbus
  #
  #     # Additional utilities
  #     cups
  #     nspr
  #     nss
  #     expat
  #
  #     # Graphics drivers and GPU support
  #     libGL
  #     libdrm
  #
  #     # Multimedia
  #     ffmpeg
  #
  #     # Additional GUI toolkits
  #     qt6.qtbase
  #
  #     # Runtime utilities
  #     util-linux
  #
  #     # Commonly needed by proprietary apps
  #     libnotify
  #     libuuid
  #     systemd
  #
  #     # Python-specific libs
  #     python3
  #     stdenv.cc.cc.lib # includes libstdc++
  #     readline
  #     bzip2
  #     sqlite
  #     xz
  #     tk
  #
  #     # Common scientific/data science dependencies
  #     lapack
  #     blas
  #
  #     # Image processing libraries often needed by Python packages
  #     libpng
  #     libjpeg
  #     libtiff
  #
  #     # SSL/TLS support for pip
  #     openssl.out
  #
  #     # Required by some scientific packages
  #     gfortran.cc.lib
  #   ]);
  # };
}
