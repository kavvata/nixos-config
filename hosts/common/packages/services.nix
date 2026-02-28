{ ... }:
rec {
  defaultServices = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    xserver.enable = false;

    flatpak.enable = true;
    tlp.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

    };
  };
  niriServices = defaultServices // {
    upower.enable = true;
  };

  swayServices = defaultServices // {
    gnome.gnome-keyring.enable = true;
  };
}
