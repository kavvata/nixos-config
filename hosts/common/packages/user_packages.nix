{ pkgs }:

with pkgs;
rec {
  gui = [
    zotero
    footage
    thunderbird
    kitty
    helium
    legcord
    zathura
    mpv
    libreoffice-fresh
    dconf-editor
    amberol
    loupe
    obsidian
  ];

  ides = [
    jetbrains.datagrip
  ];

  tex = [
    texliveFull
  ];

  cli = [
    pi-coding-agent
    nmap
    ncpamixer
    file
    yazi
    gowall
    btop
    killall
    fastfetch
    wl-clipboard
    eza
    bun
    uv
    fzf
    ripgrep
    ripgrep-all
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
    yq
    nvd
    gpu-screen-recorder
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
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    ioskeley-mono.semiCondensed-NF
    corefonts
    aegyptus
    maya
    symbola
  ];

  wmPkgs = [
    vicinae
    fuzzel
    mako
    waybar
    imv
    mpv
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
    opencode
  ];

  niriPkgs = wmPkgs ++ [
    xwayland-satellite
  ];

  swayPkgs = wmPkgs ++ [
    autotiling-rs
    grim
    slurp
    nautilus
  ];
}
