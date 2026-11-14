{
  config = {
    # mouse_warping container
    focus.mouseWarping = "container";

    # The module's default keybindings are replaced wholesale (no
    # per-key merge), so every binding is listed explicitly.
    keybindings = {
      # Basics:
      "Mod4+Return" = "exec kitty";
      "Mod4+e" = "exec kitty -e yazi";
      "Mod4+q" = "kill";
      "Mod1+space" = "exec vicinae toggle";
      "Mod4+d" = "exec vicinae toggle";
      "Mod4+Tab" = "exec vicinae deeplink vicinae://launch/wm/switch-windows";
      "Mod4+n" = "exec vicinae deeplink vicinae://launch/core/search-emojis";
      "Mod4+v" = "exec vicinae deeplink vicinae://launch/clipboard/history";
      "Mod4+Shift+c" = "exec /home/kav/.config/kav-scripts/color-picker.sh";
      "Mod4+Shift+r" = "reload";
      # $locker was set to '~/.config/sway/lock.sh' in autostart.conf
      "Mod4+Shift+q" = "exec ~/.config/sway/lock.sh";
      "Mod4+m" = "exec /home/kav/.config/kav-scripts/power-menu.sh";
      "Mod4+Shift+y" = "exec /home/kav/.config/kav-scripts/ocr-copy-text.sh";

      # Moving around:
      "Mod4+h" = "focus left";
      "Mod4+j" = "focus down";
      "Mod4+k" = "focus up";
      "Mod4+l" = "focus right";
      "Mod4+Left" = "focus left";
      "Mod4+Down" = "focus down";
      "Mod4+Up" = "focus up";
      "Mod4+Right" = "focus right";
      "Mod4+Shift+h" = "move left";
      "Mod4+Shift+j" = "move down";
      "Mod4+Shift+k" = "move up";
      "Mod4+Shift+l" = "move right";
      "Mod4+Shift+Left" = "move left";
      "Mod4+Shift+Down" = "move down";
      "Mod4+Shift+Up" = "move up";
      "Mod4+Shift+Right" = "move right";

      # Workspaces:
      "Mod4+1" = "workspace number 1";
      "Mod4+2" = "workspace number 2";
      "Mod4+3" = "workspace number 3";
      "Mod4+4" = "workspace number 4";
      "Mod4+5" = "workspace number 5";
      "Mod4+6" = "workspace number 6";
      "Mod4+7" = "workspace number 7";
      "Mod4+8" = "workspace number 8";
      "Mod4+9" = "workspace number 9";
      "Mod4+0" = "workspace number 10";
      "Mod4+Shift+1" = "move container to workspace number 1";
      "Mod4+Shift+2" = "move container to workspace number 2";
      "Mod4+Shift+3" = "move container to workspace number 3";
      "Mod4+Shift+4" = "move container to workspace number 4";
      "Mod4+Shift+5" = "move container to workspace number 5";
      "Mod4+Shift+6" = "move container to workspace number 6";
      "Mod4+Shift+7" = "move container to workspace number 7";
      "Mod4+Shift+8" = "move container to workspace number 8";
      "Mod4+Shift+9" = "move container to workspace number 9";
      "Mod4+Shift+0" = "move container to workspace number 10";
      "Mod4+Ctrl+h" = "workspace prev";
      "Mod4+Ctrl+l" = "workspace next";
      "Mod4+u" = "workspace prev";
      "Mod4+i" = "workspace next";

      # Layout stuff:
      "Mod4+Shift+b" = "splith";
      "Mod4+Shift+v" = "splitv";
      "Mod4+f" = "fullscreen";
      "Mod4+Shift+f" = "floating toggle";
      "Mod4+a" = "focus parent";

      # Scratchpad:
      "Mod4+Shift+minus" = "move scratchpad";
      "Mod4+minus" = "scratchpad show";

      # Resizing containers:
      "Mod4+r" = "mode \"resize\"";

      # Hardware keys:
      "XF86AudioRaiseVolume" = "exec pamixer -i 5 && pkill -RTMIN+1 i3blocks";
      "XF86AudioLowerVolume" = "exec pamixer -d 5 && pkill -RTMIN+1 i3blocks";
      "XF86AudioMute" = "exec pamixer -t && pkill -RTMIN+1 i3blocks";
      "XF86AudioMicMute" =
        "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle && pkill -RTMIN+1 i3blocks";
      "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
      "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";

      # Screenshot:
      "Mod4+Shift+s" =
        ''exec scr_path=~/Pictures/Screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png') && slurp | grim -g - $scr_path && cat $scr_path | wl-copy && notify-send -t 3000 "📷 Screenshot Taken".'';
      "Mod4+s" =
        ''exec scr_path=~/Pictures/Screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png') && grim $scr_path && cat $scr_path | wl-copy && notify-send -t 3000 "📷 Screenshot Taken".'';
      "Mod4+Shift+p" = "exec hyprpicker | wl-copy";
      "Mod4+Shift+w" = "exec ~/.config/kav-scripts/wallpaper-picker.sh";
    };

    modes."resize" = {
      h = "resize shrink width 10px";
      j = "resize grow height 10px";
      k = "resize shrink height 10px";
      l = "resize grow width 10px";
      Left = "resize shrink width 10px";
      Down = "resize grow height 10px";
      Up = "resize shrink height 10px";
      Right = "resize grow width 10px";
      Return = "mode \"default\"";
      Escape = "mode \"default\"";
    };
  };

  # `--whole-window` and `bindgesture` are not expressible in `keybindings`
  # (bindsym keycomb action only).
  raw = ''
    bindsym --whole-window Mod4+button8 workspace prev
    bindsym --whole-window Mod4+button9 workspace next

    bindgesture swipe:right workspace prev
    bindgesture swipe:left workspace next
    bindgesture swipe:up exec vicinae toggle
  '';
}
