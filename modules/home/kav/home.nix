{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles/bluetuith.nix
    ./dotfiles/foot.nix
    ./dotfiles/fontconfig
    ./dotfiles/fuzzel.nix
    ./dotfiles/gowall
    ./dotfiles/gtk.nix
    ./dotfiles/herdr.nix
    ./dotfiles/hyprlock.nix
    ./dotfiles/ideavimrc
    ./dotfiles/kitty.nix
    ./dotfiles/lazygit.nix
    ./dotfiles/mako
    ./dotfiles/niri
    ./dotfiles/sway
    ./dotfiles/swaylock.nix
    ./dotfiles/tmux
    ./dotfiles/wofi
    ./dotfiles/zathura
  ];

  home = {
    username = "kav";
    homeDirectory = "/home/kav";
    stateVersion = "25.11";

    packages = [ ];

    file = { };

    sessionVariables = { };
  };

  programs.home-manager.enable = true;
}
