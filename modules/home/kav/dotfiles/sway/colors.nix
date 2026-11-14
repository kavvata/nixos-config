let
  scheme = (import ../../colors.nix).colorscheme.colors;

  mkColorSet = c: {
    border = c;
    background = c;
    text = c;
    indicator = c;
    childBorder = c;
  };
in
{
  config = {
    colors = {
      background = "#000000"; # hardcoded, not from the scheme
      unfocused = mkColorSet scheme.background;
      focused = mkColorSet scheme.foreground;
      focusedInactive = mkColorSet scheme.background;
      urgent = mkColorSet scheme.warning;
    };

    output."*".bg = "~/.wallpaper fill ${scheme.background}";
  };

  raw = "";
}
