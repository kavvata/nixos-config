{ config, pkgs, ... }:

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
    ../../modules/windowManagers/niri.nix
    ../../modules/windowManagers/sway.nix
    ../../modules/greetd.nix
  ];

  networking.hostName = "bookling";

  home-manager.users.${config.my.userName} = ../../home/kav/home.nix;

  syncthing.devices = {
    "iPhone" = {
      id = "UPZ5AL3-VNLIC7Q-BSLQ3QX-EVT4LOX-OJB3442-BRDLMJU-ZSFPCQ5-X43G5QM";
    };
    "think" = {
      id = "S4L57FL-2OBPEYH-FLB76FW-ZCINPPI-B7HLMUD-3CHQ3TK-4Z7GTRK-X7RLNAQ";
    };
  };
  syncthing.folders = {
    MDBase = {
      id = "wgfwx-uf9em";
      path = "/home/kav/Documents/Notes/MDBase/";
      devices = [
        "iPhone"
        "think"
      ];
      ignorePatterns = [ ".obsidian/appearance.json" ];
    };
    Ledger = {
      id = "ubpxwp-upnxl";
      path = "/home/kav/Documents/Finances/Ledger/";
      devices = [
        "iPhone"
        "think"
      ];
      ignorePatterns = [ ".venv" ];
    };
    Zotero = {
      id = "6gdzd-mrwha";
      path = "/home/kav/Zotero/";
      devices = [
        "think"
      ];
      ignorePatterns = [ ".sqlite.bak" ];
    };
  };

  local.extraPkgs = with pkgs; [
    # yt-dlp
    # python314Packages.yt-dlp-ejs
    # deno
    gpu-screen-recorder
  ];

  system.stateVersion = "25.11";
}
