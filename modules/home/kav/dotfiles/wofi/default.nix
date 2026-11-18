{ config, pkgs, ... }:

let
  colors = config.colorschemeResolved.colors;
in
{
  home.file = {
    ".config/wofi/wallpaper.conf".source = ./wallpaper.conf;

    ".config/wofi/style.css".source = pkgs.replaceVars ./style.css.template {
      inherit (colors) background foreground;
    };
  };
}
