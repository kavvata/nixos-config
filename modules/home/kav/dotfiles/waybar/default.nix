{ config, pkgs, ... }:
let
  colors = config.colorschemeResolved.colors;
in
{

  # TODO: add modules.json with home.file

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
