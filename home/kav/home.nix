{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles/foot.nix
    ./dotfiles/fuzzel.nix
    ./dotfiles/kitty.nix
    ./dotfiles/lazygit.nix
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
