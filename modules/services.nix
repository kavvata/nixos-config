{ pkgs, lib, config, ... }:

{
  config = {
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
    services.flatpak.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    services.printing.enable = true;

    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
