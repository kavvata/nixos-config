{ config, lib, ... }:

let
  # Available colorschemes. Add new ones here.
  schemes = {
    oneDark = {
      foreground = "#979eab";
      foreground_rgba = "151, 158, 171";
      background = "#282c34";
      background_rgba = "40, 44, 52";
      comment = "#abb2bf";
      border = "#abb2bf";
      accent = "#98C379";
      alt_accent = "#98c379";
      warning = "#e06c75";
      warning_rgba = "224, 108, 117";
      red = "#be5046";
      red_rgba = "190, 80, 70";
      selection_background = "#393e48";
      selection_background_rgba = "57, 62, 72";
      color0 = "#282c34";
      color1 = "#e06c75";
      color2 = "#98c379";
      color3 = "#e5c07b";
      color4 = "#61afef";
      color5 = "#be5046";
      color6 = "#56b6c2";
      color7 = "#979eab";
      color8 = "#393e48";
      color9 = "#d19a66";
      color10 = "#56b6c2";
      color11 = "#e5c07b";
      color12 = "#61afef";
      color13 = "#be5046";
      color14 = "#56b6c2";
      color15 = "#abb2bf";
    };

    oneLight = {
      foreground = "#2a2b33";
      foreground_rgba = "42, 43, 51";
      background = "#f8f8f8";
      background_rgba = "248, 248, 248";
      comment = "#bbbbbb";
      border = "#bbbbbb";
      accent = "#3e953a";
      alt_accent = "#3e953a";
      warning = "#de3d35";
      warning_rgba = "222, 61, 53";
      red = "#de3d35";
      red_rgba = "222, 61, 53";
      selection_background = "#e5e5e6";
      selection_background_rgba = "229, 229, 230";
      color0 = "#000000";
      color1 = "#de3d35";
      color2 = "#3e953a";
      color3 = "#d2b67b";
      color4 = "#2f5af3";
      color5 = "#950095";
      color6 = "#3e953a";
      color7 = "#bbbbbb";
      color8 = "#000000";
      color9 = "#de3d35";
      color10 = "#3e953a";
      color11 = "#d2b67b";
      color12 = "#2f5af3";
      color13 = "#a00095";
      color14 = "#3e953a";
      color15 = "#ffffff";
    };
  };
in
{
  options.kav.colorscheme = lib.mkOption {
    type = lib.types.enum (lib.attrNames schemes);
    default = "oneDark";
  };

  options.colorscheme = lib.mkOption {
    type = lib.types.attrs;
    readOnly = true;
    description = "The active colorscheme; set kav.colorscheme instead.";
  };

  # The active colorscheme; dotfiles modules read this instead of
  # importing this file directly.
  config.colorscheme = schemes.${config.kav.colorscheme};
}
