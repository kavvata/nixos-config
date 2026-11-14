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

      # default_border pixel 1 / default_floating_border pixel 1
      window = {
        titlebar = false;
        border = 1;
      };

      floating = {
        titlebar = false;
        border = 1;
        # floating_modifier $mod normal (binds.conf)
        modifier = "Mod4";
      };

      # The module's default bar block ships i3status defaults; the old
      # config used a custom swaybar instead (raw bar block below).
      bars = [ ];

      colors = {
        # sway's built-in default; the module's (#ffffff) would change it
        background = "#000000";
        unfocused = mkColorSet colors.background;
        focused = mkColorSet colors.foreground;
        focusedInactive = mkColorSet colors.background;
        urgent = mkColorSet "#C4746E";
      };

      # seat seat0 xcursor_theme Adwaita 24
      seat."seat0" = {
        xcursor_theme = "Adwaita 24";
      };
    };

  raw = ''
    # Status Bar:
    bar {
        swaybar_command /home/kav/.config/sway/swaybar
    }
  '';
}
