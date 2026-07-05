{ ... }:

{
  my.wms = [ "niri" ];

  programs.niri = {
    enable = true;
    useNautilus = true;
  };

  services.upower.enable = true;
  services.tlp.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
