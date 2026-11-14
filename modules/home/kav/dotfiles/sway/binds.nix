let
  mod = "Mod4";
  terminal = "kitty";
in
{
  config = {
    # mouse_warping container
    focus.mouseWarping = "container";

    keybindings = {
      "Mod1+space" = "exec vicinae toggle";
      "${mod}+0" = "workspace number 10";
      "${mod}+1" = "workspace number 1";
      "${mod}+2" = "workspace number 2";
      "${mod}+3" = "workspace number 3";
      "${mod}+4" = "workspace number 4";
      "${mod}+5" = "workspace number 5";
      "${mod}+6" = "workspace number 6";
      "${mod}+7" = "workspace number 7";
      "${mod}+8" = "workspace number 8";
      "${mod}+9" = "workspace number 9";
      "${mod}+Ctrl+h" = "workspace prev";
      "${mod}+Ctrl+l" = "workspace next";
      "${mod}+Down" = "focus down";
      "${mod}+Left" = "focus left";
      "${mod}+Return" = "exec ${terminal}";
      "${mod}+Right" = "focus right";
      "${mod}+Shift+0" = "move container to workspace number 10";
      "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
      "${mod}+Shift+5" = "move container to workspace number 5";
      "${mod}+Shift+6" = "move container to workspace number 6";
      "${mod}+Shift+7" = "move container to workspace number 7";
      "${mod}+Shift+8" = "move container to workspace number 8";
      "${mod}+Shift+9" = "move container to workspace number 9";
      "${mod}+Shift+Down" = "move down";
      "${mod}+Shift+Left" = "move left";
      "${mod}+Shift+Right" = "move right";
      "${mod}+Shift+Up" = "move up";
      "${mod}+Shift+b" = "splith";
      "${mod}+Shift+c" = "exec /home/kav/.config/kav-scripts/color-picker.sh";
      "${mod}+Shift+f" = "floating toggle";
      "${mod}+Shift+h" = "move left";
      "${mod}+Shift+j" = "move down";
      "${mod}+Shift+k" = "move up";
      "${mod}+Shift+l" = "move right";
      "${mod}+Shift+minus" = "move scratchpad";
      "${mod}+Shift+p" = "exec hyprpicker | wl-copy";
      "${mod}+Shift+q" = "exec ~/.config/sway/lock.sh";
      "${mod}+Shift+r" = "reload";
      "${mod}+Shift+s" =
        "exec scr_path=~/Pictures/Screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png') && slurp | grim -g - $scr_path && cat $scr_path | wl-copy && notify-send -t 3000 \"📷 Screenshot Taken\".";
      "${mod}+Shift+v" = "splitv";
      "${mod}+Shift+w" = "exec ~/.config/kav-scripts/wallpaper-picker.sh";
      "${mod}+Shift+y" = "exec /home/kav/.config/kav-scripts/ocr-copy-text.sh";
      "${mod}+Tab" = "exec vicinae deeplink vicinae://launch/wm/switch-windows";
      "${mod}+Up" = "focus up";
      "${mod}+a" = "focus parent";
      "${mod}+d" = "exec vicinae toggle";
      "${mod}+e" = "exec ${terminal} -e yazi";
      "${mod}+f" = "fullscreen";
      "${mod}+h" = "focus left";
      "${mod}+i" = "workspace next";
      "${mod}+j" = "focus down";
      "${mod}+k" = "focus up";
      "${mod}+l" = "focus right";
      "${mod}+m" = "exec /home/kav/.config/kav-scripts/power-menu.sh";
      "${mod}+minus" = "scratchpad show";
      "${mod}+n" = "exec vicinae deeplink vicinae://launch/core/search-emojis";
      "${mod}+q" = "kill";
      "${mod}+r" = "mode \"resize\"";
      "${mod}+s" =
        "exec scr_path=~/Pictures/Screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png') && grim $scr_path && cat $scr_path | wl-copy && notify-send -t 3000 \"📷 Screenshot Taken\".";
      "${mod}+u" = "workspace prev";
      "${mod}+v" = "exec vicinae deeplink vicinae://launch/clipboard/history";

      # Keys the module can't express natively stay in the raw block.
      "XF86AudioLowerVolume" = "exec pamixer -d 5 && pkill -RTMIN+1 i3blocks";
      "XF86AudioMicMute" =
        "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle && pkill -RTMIN+1 i3blocks";
      "XF86AudioMute" = "exec pamixer -t && pkill -RTMIN+1 i3blocks";
      "XF86AudioRaiseVolume" = "exec pamixer -i 5 && pkill -RTMIN+1 i3blocks";
      "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
      "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
    };

    # The module emits the resize block itself when this is non-empty.
    modes."resize" = {
      "Down" = "resize grow height 10px";
      "Escape" = "mode \"default\"";
      "Left" = "resize shrink width 10px";
      "Return" = "mode \"default\"";
      "Right" = "resize grow width 10px";
      "Up" = "resize shrink height 10px";
      "h" = "resize shrink width 10px";
      "j" = "resize grow height 10px";
      "k" = "resize shrink height 10px";
      "l" = "resize grow width 10px";
    };
  };

  # `--whole-window` and `bindgesture` have no module option.
  raw =
    "bindsym --whole-window ${mod}+button8 workspace prev\n"
    + "bindsym --whole-window ${mod}+button9 workspace next\n"
    + "\n"
    + "bindgesture swipe:right workspace prev\n"
    + "bindgesture swipe:left workspace next\n"
    + "bindgesture swipe:up exec vicinae toggle\n";
}
