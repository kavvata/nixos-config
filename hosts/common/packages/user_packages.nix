{ pkgs }:

with pkgs; {
  gui = [
    kdePackages.kate
    thunderbird
    kitty
    fuzzel
    waybar
    yazi
    vicinae
    helium
    legcord
    zathura
  ];

  cli = [
    btop
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

  ];

  runtimes = [ statix tree-sitter python315 pipenv nodejs_24 ];
}
