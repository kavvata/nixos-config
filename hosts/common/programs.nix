{ pkgs, lib, config, ... }:

{
  config = {
    programs.fish = {
      enable = true;
      useBabelfish = true;
      shellAliases = {
        ls = "eza --icons auto";
        l = "ls";
        ll = "ls -lah";
      };
    };

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
      glibc stdenv.cc.cc zlib libgcc bash
      dbus expat libuuid libxcb libxkbcommon libdrm mesa
      libX11 libXcursor libXrandr libXinerama libXrender libXext libXi libXfixes libXdamage libXScrnSaver libXcomposite libXxf86vm
      wayland wayland-protocols
      alsa-lib pipewire
      freetype fontconfig harfbuzz pango cairo
      libGL libGLU libpng libjpeg libwebp giflib gdk-pixbuf
      bzip2 xz zstd
      openssl curl libnghttp2 krb5
      glib gtk3 gtk4 atk at-spi2-core at-spi2-atk
      nspr nss libnotify libsecret libcap libpulseaudio cups
    ];
  };
}
