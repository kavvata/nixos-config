let
  colors = (import ../../colors.nix).colorscheme.colors;
in
{
  config = {
    output."eDP-1" = {
      pos = "0 0";
      res = "1920x1080";
    };

    # Mirror display
    output."HDMI-A-1" = {
      pos = "0 -1080";
      res = "1920x1080";
    };

    output."*" = {
      bg = "~/.wallpaper fill ${colors.background}";
    };
  };

  raw = "";
}
