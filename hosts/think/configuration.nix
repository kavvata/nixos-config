{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/core.nix
    ../common/users.nix
    ../common/networking.nix
    ../common/services.nix
    ../common/programs.nix
    ../common/user_packages.nix
    ../common/syncthing.nix
    ../common/windowManagers/sway.nix
    ../common/greetd.nix
  ];

  networking.hostName = "think";

  i18n.inputMethod = {
    type = "ibus";
    enable = true;
  };

  syncthing.devices = {
    "iPhone" = {
      id = "UPZ5AL3-VNLIC7Q-BSLQ3QX-EVT4LOX-OJB3442-BRDLMJU-ZSFPCQ5-X43G5QM";
    };
    "bookling" = {
      id = "TXX6RBS-67UIR5Y-PLMROC4-XJ2AZGY-7XNFGTT-ISHY2SM-2TR6TAN-2EY6YAY";
    };
  };
  syncthing.folders = {
    MDBase = {
      id = "wgfwx-uf9em";
      path = "/home/kav/Documents/Notes/MDBase/";
      devices = [ "iPhone" "bookling" ];
      ignorePatterns = [ ".obsidian/appearance.json" ];
    };
    Ledger = {
      id = "ubpxwp-upnxl";
      path = "/home/kav/Documents/Finances/Ledger/";
      devices = [ "iPhone" "bookling" ];
      ignorePatterns = [ ".venv" ];
    };
  };

  local.extraPkgs = with pkgs; [
    gimp
    zen-browser
  ];

  system.stateVersion = "25.11";
}
