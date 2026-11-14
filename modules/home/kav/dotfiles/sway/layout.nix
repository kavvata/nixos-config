{
  config =
    let
      colors = (import ../../colors.nix).colorscheme.colors;

      mkColorSet = c: {
        border = c;
        background = c;
        text = c;
        indicator = c;
        childBorder = c;
      };
    in
    {
      gaps = {
        inner = 4;
        outer = 0;
      };

      # default_border pixel 1
      window = {
        titlebar = false;
        border = 1;
      };

      colors = {
        background = "#000000";
        unfocused = mkColorSet colors.background;
        focused = mkColorSet colors.foreground;
        focusedInactive = mkColorSet colors.background;
        urgent = mkColorSet colors.warning;
      };
    };

  raw = "";
}
