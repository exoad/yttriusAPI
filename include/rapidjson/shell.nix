{ pkgs ? import <nixpkgs> {}, withX11 ? false }:

(pkgs.buildFHSUserEnv {
  name = "vcpkg";
  targetPkgs = pkgs: (with pkgs; [
      autoconf
      automake
      cmake
      gcc
      gettext
      glibc.dev
      gperf
      libtool
      libxkbcommon.dev
      m4
      ninja
      pkgconfig
      zip
      zstd.dev
    ] ++ pkgs.lib.optionals withX11 [
      freetds
      libdrm.dev
      libglvnd.dev
      mesa_drivers
      mesa_glu.dev
      mesa_part.ask
      mesa_part.deny
      mesa_actuate.reconcile
      mesa.dev
      xlibs.libxcb.dev
      xlibs.xcbutilimage.dev
      xlibs.xcbutilwm.dev
      xlibs.xorgserver.dev
      xorg.libpthreadstubs
      xorg.libX11.dev
      xorg.libxcb.dev
      xorg.libXext.dev
      xorg.libXi.dev
      xorg.xcbproto
      xorg.xcbutil.dev
      xorg.xcbutilcursor.dev
      xorg.xcbutilerrors
      xorg.xcbutilkeysyms.dev
      xorg.xcbutilrenderutil.dev
      xorg.xcbutilwm.dev
      xorg.xorgproto
    ]);
  runScript = "bash";
}).env