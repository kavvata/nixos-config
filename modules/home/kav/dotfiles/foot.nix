{ config, lib, ... }:
let
  # NOTE: foot uses hex color codes without the `#` prefix
  colors = lib.mapAttrs (_: value: lib.removePrefix "#" value) config.colorscheme.colors;
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
        inherit (colors) foreground;
        inherit (colors) background;

        selection-foreground = colors.foreground;
        selection-background = colors.selection_background;

        regular0 = colors.color0;
        regular1 = colors.color1;
        regular2 = colors.color2;
        regular3 = colors.color3;
        regular4 = colors.color4;
        regular5 = colors.color5;
        regular6 = colors.color6;
        regular7 = colors.color7;

        bright0 = colors.color8;
        bright1 = colors.color9;
        bright2 = colors.color10;
        bright3 = colors.color11;
        bright4 = colors.color12;
        bright5 = colors.color13;
        bright6 = colors.color14;
        bright7 = colors.color15;
      };
    };
  };
}
