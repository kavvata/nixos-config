{ config, lib, ... }:

let
  # Available colorschemes. Add new ones here.
  schemes = {
    one_dark = {
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
  };
in
{
  options.kav.colorscheme = lib.mkOption {
    type = lib.types.enum (lib.attrNames schemes);
    default = "one_dark";
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
