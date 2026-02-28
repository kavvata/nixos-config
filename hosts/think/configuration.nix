# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

let
  userPkgs = import ../common/packages/user_packages.nix { inherit pkgs; };
  commonServices = import ../common/packages/services.nix { };
  commonPrograms = import ../common/packages/programs.nix { inherit pkgs; };
  networkingConfig = import ../common/optional/networking.nix {
    inherit pkgs;
    hostName = "think";
  };
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../common/optional/greetd.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  security.rtkit.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kav = {
    isNormalUser = true;
    description = "kav";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages =
      userPkgs.gui ++ userPkgs.cli ++ userPkgs.runtimes ++ userPkgs.swayPkgs ++ userPkgs.niriPkgs;
    shell = pkgs.fish;
  };

  virtualisation.docker = {
    enable = true;
  };

  fonts.packages = userPkgs.fonts;
  programs = commonPrograms.swayPrograms // commonPrograms.niriPrograms;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    tmux
    wget
    gcc
    git
    adwaita-icon-theme
    intel-media-driver
  ];

  networking = networkingConfig;

  services = {
    syncthing = {
      enable = true;
      openDefaultPorts = true; # Open ports in the firewall for Syncthing. (NOTE: this will not open syncthing gui port)
      user = "kav";
      configDir = "/home/kav/.config/syncthing";
      settings = {
        devices = {
          "iPhone" = {
            id = "UPZ5AL3-VNLIC7Q-BSLQ3QX-EVT4LOX-OJB3442-BRDLMJU-ZSFPCQ5-X43G5QM";
          };
          "bookling" = {
            id = "TXX6RBS-67UIR5Y-PLMROC4-XJ2AZGY-7XNFGTT-ISHY2SM-2TR6TAN-2EY6YAY";
          };
        };
        folders = {
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
        };
      };
    };
  }
  // commonServices.swayServices
  // commonServices.niriServices;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
