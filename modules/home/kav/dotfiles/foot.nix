{ config, lib, ... }:
let
  # NOTE: foot uses hex color codes without the `#` prefix
  scheme = lib.mapAttrs (_: value: lib.removePrefix "#" value) config.colorscheme;
in
{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Iosevka Nerd Font:size=10";
        pad = "3x3";
        initial-window-size-pixels = "640x540";
        resize-delay-ms = "0";
      };

      bell = {
        urgent = "no";
        system = "no";
      };

      key-bindings = {
        font-increase = "Control+equal";
        font-decrease = "Control+minus";
        font-reset = "Control+0";
      };

      colors-dark = {
        inherit (scheme) foreground;
        inherit (scheme) background;

        selection-foreground = scheme.foreground;
        selection-background = scheme.selection_background;

        regular0 = scheme.color0;
        regular1 = scheme.color1;
        regular2 = scheme.color2;
        regular3 = scheme.color3;
        regular4 = scheme.color4;
        regular5 = scheme.color5;
        regular6 = scheme.color6;
        regular7 = scheme.color7;

        bright0 = scheme.color8;
        bright1 = scheme.color9;
        bright2 = scheme.color10;
        bright3 = scheme.color11;
        bright4 = scheme.color12;
        bright5 = scheme.color13;
        bright6 = scheme.color14;
        bright7 = scheme.color14;
      };
    };
  };
}
