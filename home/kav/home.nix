{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles/bluetuith.nix
    ./dotfiles/foot.nix
    ./dotfiles/fontconfig.nix
    ./dotfiles/fuzzel.nix
    ./dotfiles/gtk.nix
    ./dotfiles/herdr.nix
    ./dotfiles/kitty.nix
    ./dotfiles/lazygit.nix
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
