{ pkgs, ... }:

let
  colors = (import ../../colors.nix).colorscheme.colors;
in {
  home.file."config/zathura/zathurarc".source =
    pkgs.replaceVars ./zathurarc.template {
      inherit (colors) alt_accent background foreground;
    };
}
