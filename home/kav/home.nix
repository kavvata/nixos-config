{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles/kitty.nix
    ./dotfiles/tmux.nix
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
