colors:
let
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
      unfocused = mkColorSet colors.background;
      focused = mkColorSet colors.foreground;
      focusedInactive = mkColorSet colors.background;
      urgent = mkColorSet colors.warning;
    };

    output."*".bg = "~/.wallpaper fill ${colors.background}";
  };

  raw = "";
}
