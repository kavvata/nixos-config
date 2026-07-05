{ pkgs, lib, ... }:

{
  options.my = {
    wms = lib.mkOption {
      type = lib.types.listOf (lib.types.enum [ "niri" "sway" "pantheon" ]);
      default = [ ];
    };
    userName = lib.mkOption {
      type = lib.types.str;
      default = "kav";
    };
  };

  config = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    time.timeZone = "America/Sao_Paulo";
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
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
    };

    security.rtkit.enable = true;

    nixpkgs.config.allowUnfree = true;

    virtualisation.docker.enable = true;

    environment.systemPackages = with pkgs; [
      neovim
      tmux
      wget
      gcc
      git
      adwaita-icon-theme
      intel-media-driver
    ];

    fonts.packages = with pkgs; [
      inter
      geist-font
      ibm-plex
      nerd-fonts.victor-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      corefonts
      aegyptus
      maya
      symbola
    ];
  };
}
