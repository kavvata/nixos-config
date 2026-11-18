{ config, pkgs, ... }:

let
  colors = config.colorschemeResolved.colors;
in
{
  home.file.".config/mako/config".source = pkgs.replaceVars ./config.template {
    inherit (colors) background foreground;
  };
}
