let
  colors = (import ../colors.nix).colorscheme.colors;
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      background = {
        monitor = "";
        path = "$HOME/.lockscreen";
        blur_size = 3;
        blur_passes = 2;
      };

      "input-field" = {
        monitor = "";
        size = "133, 33";
        outline_thickness = 1;
        dots_size = "0.33"; # string: Nix floats render as "0.330000"
        dots_spacing = "0.15";
        dots_center = true;
        dots_rounding = -1;
        outer_color = "rgba(${colors.foreground_rgba}, 0.60)";
        inner_color = "rgba(${colors.background_rgba}, 0.90)";
        font_color = "rgba(${colors.foreground_rgba}, 1.0)";
        font_family = "Iosevka Nerd Font";
        fade_on_empty = true;
        fade_timeout = 1000;
        placeholder_text = "<i>Input Password...</i>";
        hide_input = false;
        rounding = -1;
        check_color = "rgba(${colors.red_rgba}, 1.0)";
        fail_color = "rgba(${colors.warning_rgba}, 1.0)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        fail_transition = 300;
        capslock_color = -1;
        numlock_color = -1;
        bothlock_color = -1;
        invert_numlock = false;
        swap_font_color = false;
        position = "0, 32";
        halign = "center";
        valign = "bottom";
      };

      label = {
        monitor = "";
        text = "cmd[update:1000] echo \"$(date '+%H:%M:%S')\"";
        color = "rgba(${colors.foreground_rgba}, 0.85)";
        font_size = 16;
        font_family = "Iosevka Nerd Font Bold";
        position = "0, 80";
        halign = "center";
        # "botton" is a typo in the original config; kept as-is so behavior doesn't change.
        valign = "botton";
      };
    };
  };
}
