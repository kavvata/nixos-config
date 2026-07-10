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
    ../common/windowManagers/niri.nix
    ../common/windowManagers/sway.nix
    ../common/greetd.nix
  ];

  networking.hostName = "bookling";

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
    Org = {
      id = "mhmxx-ymd6i";
      path = "/home/kav/Documents/Notes/org/";
      devices = [
        "iPhone"
        "think"
      ];
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
  };

  local.extraPkgs = with pkgs; [
    yt-dlp
    python314Packages.yt-dlp-ejs
    deno
    gpu-screen-recorder
    zen-browser
  ];

  system.stateVersion = "25.11";
}
