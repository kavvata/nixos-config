{ pkgs, ... }:

let
  colors = (import ../../colors.nix).colorscheme.colors;
in {
  home.file."config/mako/config".source =
    pkgs.replaceVars ./config.template {
      inherit (colors) background foreground;
    };
}
