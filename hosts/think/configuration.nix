# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

let userPkgs = import ../common/packages/user_packages.nix { inherit pkgs; };
in {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  services = {

    # services.blueman.enable = true;

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    xserver.enable = false;

    flatpak.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm = {
      enable = true;
      settings.Theme = {
        CursorTheme = "Adwaita";
        Font = "Geist Light";
      };
    };
    desktopManager.plasma6.enable = true;

    # Configure keymap in X11
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
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;

    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    syncthing = {
      enable = true;
      openDefaultPorts =
        true; # Open ports in the firewall for Syncthing. (NOTE: this will not open syncthing gui port)
      user = "kav";
      configDir = "/home/kav/.config/syncthing";
      settings = {
        devices = {
          "iPhone" = {
            id =
              "UPZ5AL3-VNLIC7Q-BSLQ3QX-EVT4LOX-OJB3442-BRDLMJU-ZSFPCQ5-X43G5QM";
          };
          "bookling" = {
            id =
              "TXX6RBS-67UIR5Y-PLMROC4-XJ2AZGY-7XNFGTT-ISHY2SM-2TR6TAN-2EY6YAY";
          };
        };
        folders = {
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
      };
    };
  };

  security.rtkit.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kav = {
    isNormalUser = true;
    description = "kav";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = userPkgs.gui ++ userPkgs.cli ++ userPkgs.runtimes;
    shell = pkgs.fish;
  };

  virtualisation.docker = { enable = true; };

  fonts.packages = with pkgs; [
    geist-font
    ibm-plex
    nerd-fonts.jetbrains-mono
    hachimarupop
  ];
  programs = {
    # firefox.enable = true;

    fish = {
      enable = true;
      shellAliases = {
        ls = "eza --icons auto";
        l = "ls";
        ll = "ls -lah";
      };
    };

    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      # Core runtime
      glibc
      stdenv.cc.cc
      zlib
      libgcc
      bash

      # Common system libs
      dbus
      expat
      libuuid
      libxcb
      libxkbcommon
      libdrm
      mesa

      # X11
      xorg.libX11
      xorg.libXcursor
      xorg.libXrandr
      xorg.libXinerama
      xorg.libXrender
      xorg.libXext
      xorg.libXi
      xorg.libXfixes
      xorg.libXdamage
      xorg.libXScrnSaver
      xorg.libXcomposite
      xorg.libXxf86vm

      # Wayland
      wayland
      wayland-protocols

      # Audio
      alsa-lib
      pipewire

      # Fonts / text
      freetype
      fontconfig
      harfbuzz
      pango
      cairo

      # Graphics & images
      libGL
      libGLU
      libpng
      libjpeg
      libwebp
      giflib
      gdk-pixbuf

      # Compression / archives
      bzip2
      xz
      zstd

      # Networking & crypto
      openssl
      curl
      libnghttp2
      krb5

      # GTK
      glib
      gtk3
      gtk4
      atk
      at-spi2-core
      at-spi2-atk

      # Misc
      nspr
      nss
      libnotify
      libsecret
      libcap
      libpulseaudio
      cups
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kdePackages.sddm-kcm
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    tmux
    wget
    gcc
    git
    adwaita-icon-theme
    intel-media-driver
  ];
  networking = {

    hostName = "think"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;

  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
