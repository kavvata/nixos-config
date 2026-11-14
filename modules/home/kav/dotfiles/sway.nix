{ pkgs, lib, ... }:

let
  colors = (import ../colors.nix).colorscheme.colors;
in
{
  wayland.windowManager.sway = {
    enable = true;

    # The system config installs swayfx with the gtk wrapper; the module
    # needs its own package for build-time validation and `swaymsg reload`
    # on config change.
    package = pkgs.swayfx.override { withGtkWrapper = true; };

    # checkPhase runs sway under xvfb, where swayfx's fx_renderer cannot
    # create a renderer ("no DRM FD available") regardless of the config's
    # correctness; verified live in a real session instead.
    checkConfig = false;

    config = {
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

      # mouse_warping container (binds.conf)
      focus.mouseWarping = "container";

      # The module's default bar block ships i3status defaults; the old
      # config used a custom swaybar instead (raw bar block in extraConfig).
      bars = [ ];

      colors =
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

      input."type:touchpad" = {
        dwt = "enabled";
        tap = "enabled";
        natural_scroll = "enabled";
        middle_emulation = "enabled";
        pointer_accel = "0.2";
        scroll_factor = "0.5";
        drag_lock = "disabled";
      };

      input."type:keyboard" = {
        xkb_layout = "us,br(thinkpad)";
        xkb_options = "grp:win_space_toggle";
        repeat_delay = "250";
        repeat_rate = "30";
      };

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

      # The workspace name is rendered verbatim, hence "workspace number N".
      # Keys sort with 10 before 9, matching the old include order (first
      # match wins).
      assigns."workspace number 10" = [ { app_id = "legcord"; } ];
      assigns."workspace number 9" = [ { app_id = "com.mastermindzh.tidal-hifi"; } ];
    };

    # The old `exec dbus-update-activation-environment ...` line is replaced
    # by the module's systemdActivation line (systemd.enable, default true);
    # `include /etc/sway/config.d/*` is dropped with it.
    extraConfig = ''
      # Status Bar:
      bar {
          swaybar_command /home/kav/.config/sway/swaybar
      }

      exec eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

      exec vicinae server --replace

      exec --no-startup-id '~/.config/sway/notify-layout-change.sh'

      exec swayidle -w \
             timeout 300 ~/.config/sway/lock.sh \
             timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
             timeout 1200 'systemctl suspend-then-hibernate' resume 'swaymsg "output * power on"' \
             before-sleep ~/.config/sway/lock.sh \
             after-resume 'swaymsg "output * power on"'

      exec --no-startup-id autotiling-rs

      bindsym --whole-window Mod4+button8 workspace prev
      bindsym --whole-window Mod4+button9 workspace next

      bindgesture swipe:right workspace prev
      bindgesture swipe:left workspace next
      bindgesture swipe:up exec vicinae toggle

      ### swayfx options
      corner_radius 4
      shadows enable
      default_dim_inactive 0.05

      blur_passes 2
      blur_brightness 0.90
      blur enable

      layer_effects "vicinae" 'blur enable;'
      layer_effects "waybar" 'blur enable;'
      # layer_effects "fuzzel" 'blur enable;'
      # layer_effects "rofi" 'blur enable;'
    '';
  };
}
