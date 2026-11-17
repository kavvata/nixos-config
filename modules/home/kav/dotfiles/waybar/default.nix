{ config, pkgs, ... }:
let
  colors = config.colorscheme;
in
{
  programs.waybar = {
    enable = true;
    style = pkgs.replaceVars ./style.css.template {
      inherit (colors)
        foreground
        background_rgba
        comment
        border
        accent
        alt_accent
        warning
        ;
    };
  };
}
