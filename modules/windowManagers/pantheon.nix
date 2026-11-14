{ ... }:

{
  my.wms = [ "pantheon" ];

  services.xserver.desktopManager.pantheon.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
}
