{
  config = {
    floating = {
      titlebar = false;
      border = 1;
      # floating_modifier $mod normal (binds.conf)
      modifier = "Mod4";
    };

    # The module's default bar block ships i3status defaults; the old
    # config used a custom swaybar instead (raw bar block below).
    bars = [ ];

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
