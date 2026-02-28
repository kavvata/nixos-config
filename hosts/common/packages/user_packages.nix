{ pkgs }:

with pkgs;
rec {
  gui = [
    thunderbird
    kitty
    vicinae
    helium
    legcord
    zathura
    mpv
    libreoffice-fresh
    dconf-editor
    amberol
    gnome-software
    nautilus
  ];

  ides = [
    zed-editor
    jetbrains.datagrip
  ];

  cli = [
    yazi
    btop
    killall
    fastfetch
    wl-clipboard
    eza
    bun
    uv
    fzf
    ripgrep
    fd
    tldr
    chezmoi
    gh
    zoxide
    lazygit
    lazydocker
    zip
    unzip
    ffmpeg-full
    cargo
    hledger
    hledger-ui
    bat
    flatpak
    libqalculate
    sqlite
    gnumake42
    nix-search-cli
    trash-cli
    dust
    httpie
    jq
  ];

  runtimes = [
    statix
    tree-sitter
    python315
    pipenv
    nodejs_24
  ];

  fonts = [
    inter
    geist-font
    ibm-plex
    nerd-fonts.jetbrains-mono
    corefonts
  ];

  wmPkgs = [
    fuzzel
    mako
    waybar
    wofi
    bluetuith
    swaybg
    hyprpicker
    hyprlock
    libnotify
    pamixer
    brightnessctl
    polkit_gnome
    swayidle
    udiskie
  ];

  niriPkgs = wmPkgs ++ [ xwayland-satellite ];

  swayPkgs = wmPkgs ++ [
    autotiling-rs
    grim
    slurp
  ];
}
