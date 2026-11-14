{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core.nix
    ../../modules/users.nix
    ../../modules/networking.nix
    ../../modules/services.nix
    ../../modules/programs.nix
    ../../modules/user_packages.nix
    ../../modules/syncthing.nix
    ../../modules/windowManagers/sway.nix
    ../../modules/greetd.nix
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
      devices = [
        "iPhone"
        "bookling"
      ];
      ignorePatterns = [ ".obsidian/appearance.json" ];
    };
    Ledger = {
      id = "ubpxwp-upnxl";
      path = "/home/kav/Documents/Finances/Ledger/";
      devices = [
        "iPhone"
        "bookling"
      ];
      ignorePatterns = [ ".venv" ];
    };
    Zotero = {
      id = "6gdzd-mrwha";
      path = "/home/kav/Zotero/";
      devices = [
        "bookling"
      ];
      ignorePatterns = [ ".sqlite.bak" ];
    };
  };

  local.extraPkgs = with pkgs; [
    gimp
  ];

  system.stateVersion = "25.11";
}
