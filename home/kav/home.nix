{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles/bluetuith.nix
    ./dotfiles/foot.nix
    ./dotfiles/fontconfig.nix
    ./dotfiles/fuzzel.nix
    ./dotfiles/gowall.nix
    ./dotfiles/gtk.nix
    ./dotfiles/herdr.nix
    ./dotfiles/hyprlock.nix
    ./dotfiles/ideavimrc.nix
    ./dotfiles/kitty.nix
    ./dotfiles/lazygit.nix
    ./dotfiles/mako.nix
    ./dotfiles/swaylock.nix
    ./dotfiles/tmux.nix
    ./dotfiles/wofi.nix
  ];

  home = {
    username = "kav";
    homeDirectory = "/home/kav";
    stateVersion = "24.05";

    packages = [ ];

    file = { };

    sessionVariables = { };
  };

  programs.home-manager.enable = true;
}
