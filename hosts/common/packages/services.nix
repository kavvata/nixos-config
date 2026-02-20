{ ... }:
{
  niriServices = {
    upower.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
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
}
