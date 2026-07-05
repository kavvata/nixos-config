{ config, pkgs, ... }:

{
  home.username = "kav";
  home.homeDirectory = "/home/kav";
  home.stateVersion = "24.05";

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = { };

  programs.home-manager.enable = true;
}
