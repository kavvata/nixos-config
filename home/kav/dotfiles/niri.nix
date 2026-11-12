{ pkgs, ... }:

let
  colors = (import ../colors.nix).colorscheme.colors;
in
{
  wayland.windowManager.niri = {
    enable = true;

    # The system config (hosts/common/windowManagers/niri.nix) already owns
    # the niri package, the xdg portal setup and the niri user-service
    # drop-in. Keeping the package here only enables
    # `niri validate --config` at build time (checkConfig); portalPackage
    # stays null to avoid duplicating the portal wiring.
    package = pkgs.niri;
    portalPackage = null;

    settings = {
      # config.kdl -----------------------------------------------------------
      prefer-no-csd = { };

      cursor."xcursor-theme" = "Adwaita";

      "screenshot-path" = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      # config/input.kdl ------------------------------------------------------
      input = {
        "warp-mouse-to-focus" = { };

        keyboard = {
          xkb = {
            layout = "us,br(thinkpad)";
            options = "grp:win_space_toggle";
          };
          "repeat-delay" = 250;
          "repeat-rate" = 25;
        };

        touchpad = {
          tap = { };
          "natural-scroll" = { };
          "accel-speed" = 0.2;
          "scroll-factor" = 0.5;
        };

        mouse = { };
        trackpoint = { };

        "focus-follows-mouse"._props = {
          "max-scroll-amount" = "0%";
        };
      };

      # config/layout.kdl.tmpl (colors from the one_dark colorscheme) ---------
      overview = {
        "backdrop-color" = colors.background;
        "workspace-shadow" = {
          off = { };
        };
        zoom = 0.33;
      };

      layout = {
        gaps = 4;
        "background-color" = "transparent";
        "center-focused-column" = "on-overflow";

        # Order matters: these presets are indexed.
        "preset-column-widths"._children = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        "default-column-width" = {
          proportion = 0.5;
        };

        focus-ring = {
          off = { };
          width = 1;
          "active-color" = colors.foreground;
          "inactive-color" = colors.background;
          "urgent-color" = "#C4746E";
        };

        border = {
          on = { };
          width = 1;
          "active-color" = colors.foreground;
          "urgent-color" = "#C4746E";
        };

        shadow = {
          on = { };
          softness = 20;
          spread = 5;
          offset._props = {
            x = 0;
            y = 5;
          };
          color = "#0007";
        };

        struts = { };
      };

      # config/animations.kdl ---------------------------------------------------
      animations = {
        "workspace-switch" = {
          spring._props = {
            "damping-ratio" = 1.0;
            stiffness = 1000;
            epsilon = 0.0001;
          };
        };
        "window-open" = {
          "duration-ms" = 150;
          curve = "ease-out-expo";
        };
        "window-close" = {
          "duration-ms" = 150;
          curve = "ease-out-quad";
        };
        "horizontal-view-movement" = {
          spring._props = {
            "damping-ratio" = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        "window-movement" = {
          spring._props = {
            "damping-ratio" = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        "window-resize" = {
          spring._props = {
            "damping-ratio" = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        "config-notification-open-close" = {
          spring._props = {
            "damping-ratio" = 0.6;
            stiffness = 1000;
            epsilon = 0.001;
          };
        };
        "exit-confirmation-open-close" = {
          spring._props = {
            "damping-ratio" = 0.6;
            stiffness = 500;
            epsilon = 0.01;
          };
        };
        "screenshot-ui-open" = {
          "duration-ms" = 200;
          curve = "ease-out-quad";
        };
        "overview-open-close" = {
          spring._props = {
            "damping-ratio" = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
      };

      # config/binds.kdl ---------------------------------------------------------
      binds = {
        "Mod+Shift+Slash" = {
          "show-hotkey-overlay" = { };
        };
        "Mod+V" = {
          _props."hotkey-overlay-title" = "Clipboard Manager";
          spawn = [
            "vicinae"
            "deeplink"
            "vicinae://launch/clipboard/history"
          ];
        };
        "Mod+Tab" = {
          _props."hotkey-overlay-title" = "Open Window Search";
          spawn = [
            "vicinae"
            "deeplink"
            "vicinae://launch/wm/switch-windows"
          ];
        };
        "Alt+Space" = {
          _props."hotkey-overlay-title" = "Open Applicaiton Launcher";
          spawn = [
            "vicinae"
            "toggle"
          ];
        };
        "Mod+Return" = {
          _props = {
            repeat = false;
            "hotkey-overlay-title" = "Open a Terminal: kitty";
          };
          spawn = [ "kitty" ];
        };
        "Super+Alt+L" = {
          _props."hotkey-overlay-title" = "Lock the Screen: hyprlock";
          spawn = [ "hyprlock" ];
        };
        "Mod+N" = {
          _props."hotkey-overlay-title" = "Open emoji picker";
          spawn = [
            "vicinae"
            "deeplink"
            "vicinae://launch/core/search-emojis"
          ];
        };
        "Mod+E" = {
          _props."hotkey-overlay-title" = "Open yazi file explorer";
          spawn = [
            "kitty"
            "-e"
            "yazi"
          ];
        };
        "Mod+Shift+C" = {
          _props."hotkey-overlay-title" = "Open color picker";
          spawn = [ "/home/kav/.config/kav-scripts/color-picker.sh" ];
        };
        "Mod+Shift+Y" = {
          _props."hotkey-overlay-title" = "Yank text with OCR";
          spawn = [ "/home/kav/.config/kav-scripts/ocr-copy-text.sh" ];
        };
        "Mod+Shift+W" = {
          _props."hotkey-overlay-title" = "Open wallpaper picker";
          spawn = [ "/home/kav/.config/kav-scripts/wallpaper-picker.sh" ];
        };
        "Mod+Shift+B" = {
          _props."hotkey-overlay-title" = "Reload bar";
          spawn = [ "/home/kav/.config/niri/bin/reload-bar.sh" ];
        };

        XF86AudioRaiseVolume = {
          _props."allow-when-locked" = true;
          spawn = [
            "pamixer"
            "-i"
            "5"
          ];
        };
        XF86AudioLowerVolume = {
          _props."allow-when-locked" = true;
          spawn = [
            "pamixer"
            "-d"
            "5"
          ];
        };
        XF86AudioMute = {
          _props."allow-when-locked" = true;
          spawn = [
            "pamixer"
            "-t"
          ];
        };
        XF86AudioMicMute = {
          _props."allow-when-locked" = true;
          spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SOURCE@"
            "toggle"
          ];
        };

        XF86MonBrightnessUp = {
          _props."allow-when-locked" = true;
          spawn = [
            "brightnessctl"
            "--class=backlight"
            "set"
            "+10%"
          ];
        };
        XF86MonBrightnessDown = {
          _props."allow-when-locked" = true;
          spawn = [
            "brightnessctl"
            "--class=backlight"
            "set"
            "10%-"
          ];
        };

        "Mod+O" = {
          _props.repeat = false;
          "toggle-overview" = { };
        };
        "Mod+A" = {
          _props.repeat = false;
          "toggle-overview" = { };
        };
        "Mod+Q" = {
          _props.repeat = false;
          "close-window" = { };
        };

        "Mod+Left" = {
          "focus-column-left" = { };
        };
        "Mod+Down" = {
          "focus-window-down" = { };
        };
        "Mod+Up" = {
          "focus-window-up" = { };
        };
        "Mod+Right" = {
          "focus-column-right" = { };
        };
        "Mod+H" = {
          "focus-column-left" = { };
        };
        "Mod+J" = {
          "focus-window-down" = { };
        };
        "Mod+K" = {
          "focus-window-up" = { };
        };
        "Mod+L" = {
          "focus-column-right" = { };
        };

        "Mod+Shift+Left" = {
          "move-column-left" = { };
        };
        "Mod+Shift+Down" = {
          "move-window-down" = { };
        };
        "Mod+Shift+Up" = {
          "move-window-up" = { };
        };
        "Mod+Shift+Right" = {
          "move-column-right" = { };
        };
        "Mod+Shift+H" = {
          "move-column-left" = { };
        };
        "Mod+Shift+J" = {
          "move-window-down" = { };
        };
        "Mod+Shift+K" = {
          "move-window-up" = { };
        };
        "Mod+Shift+L" = {
          "move-column-right" = { };
        };

        "Mod+Home" = {
          "focus-column-first" = { };
        };
        "Mod+End" = {
          "focus-column-last" = { };
        };
        "Mod+Ctrl+Home" = {
          "move-column-to-first" = { };
        };
        "Mod+Ctrl+End" = {
          "move-column-to-last" = { };
        };

        "Mod+Ctrl+Left" = {
          "focus-monitor-left" = { };
        };
        "Mod+Ctrl+Down" = {
          "focus-monitor-down" = { };
        };
        "Mod+Ctrl+Up" = {
          "focus-monitor-up" = { };
        };
        "Mod+Ctrl+Right" = {
          "focus-monitor-right" = { };
        };
        "Mod+Ctrl+H" = {
          "focus-monitor-left" = { };
        };
        "Mod+Ctrl+J" = {
          "focus-monitor-down" = { };
        };
        "Mod+Ctrl+K" = {
          "focus-monitor-up" = { };
        };
        "Mod+Ctrl+L" = {
          "focus-monitor-right" = { };
        };

        "Mod+Shift+Ctrl+Left" = {
          "move-column-to-monitor-left" = { };
        };
        "Mod+Shift+Ctrl+Down" = {
          "move-column-to-monitor-down" = { };
        };
        "Mod+Shift+Ctrl+Up" = {
          "move-column-to-monitor-up" = { };
        };
        "Mod+Shift+Ctrl+Right" = {
          "move-column-to-monitor-right" = { };
        };
        "Mod+Shift+Ctrl+H" = {
          "move-column-to-monitor-left" = { };
        };
        "Mod+Shift+Ctrl+J" = {
          "move-column-to-monitor-down" = { };
        };
        "Mod+Shift+Ctrl+K" = {
          "move-column-to-monitor-up" = { };
        };
        "Mod+Shift+Ctrl+L" = {
          "move-column-to-monitor-right" = { };
        };

        "Mod+Page_Down" = {
          "focus-workspace-down" = { };
        };
        "Mod+Page_Up" = {
          "focus-workspace-up" = { };
        };
        "Mod+U" = {
          "focus-workspace-down" = { };
        };
        "Mod+I" = {
          "focus-workspace-up" = { };
        };
        "Mod+Shift+Page_Down" = {
          "move-column-to-workspace-down" = { };
        };
        "Mod+Shift+Page_Up" = {
          "move-column-to-workspace-up" = { };
        };
        "Mod+Shift+U" = {
          "move-column-to-workspace-down" = { };
        };
        "Mod+Shift+I" = {
          "move-column-to-workspace-up" = { };
        };

        "Mod+Ctrl+Page_Down" = {
          "move-workspace-down" = { };
        };
        "Mod+Ctrl+Page_Up" = {
          "move-workspace-up" = { };
        };
        "Mod+Ctrl+U" = {
          "move-workspace-down" = { };
        };
        "Mod+Ctrl+I" = {
          "move-workspace-up" = { };
        };

        "Mod+WheelScrollDown" = {
          _props."cooldown-ms" = 150;
          "focus-workspace-down" = { };
        };
        "Mod+WheelScrollUp" = {
          _props."cooldown-ms" = 150;
          "focus-workspace-up" = { };
        };
        "Mod+Ctrl+WheelScrollDown" = {
          _props."cooldown-ms" = 150;
          "move-column-to-workspace-down" = { };
        };
        "Mod+Ctrl+WheelScrollUp" = {
          _props."cooldown-ms" = 150;
          "move-column-to-workspace-up" = { };
        };

        "Mod+WheelScrollRight" = {
          "focus-column-right" = { };
        };
        "Mod+WheelScrollLeft" = {
          "focus-column-left" = { };
        };
        "Mod+Ctrl+WheelScrollRight" = {
          "move-column-right" = { };
        };
        "Mod+Ctrl+WheelScrollLeft" = {
          "move-column-left" = { };
        };

        "Mod+Shift+WheelScrollDown" = {
          "focus-column-right" = { };
        };
        "Mod+Shift+WheelScrollUp" = {
          "focus-column-left" = { };
        };
        "Mod+Ctrl+Shift+WheelScrollDown" = {
          "move-column-right" = { };
        };
        "Mod+Ctrl+Shift+WheelScrollUp" = {
          "move-column-left" = { };
        };

        "Mod+1" = {
          "focus-workspace" = [ 1 ];
        };
        "Mod+2" = {
          "focus-workspace" = [ 2 ];
        };
        "Mod+3" = {
          "focus-workspace" = [ 3 ];
        };
        "Mod+4" = {
          "focus-workspace" = [ 4 ];
        };
        "Mod+5" = {
          "focus-workspace" = [ 5 ];
        };
        "Mod+6" = {
          "focus-workspace" = [ 6 ];
        };
        "Mod+7" = {
          "focus-workspace" = [ 7 ];
        };
        "Mod+8" = {
          "focus-workspace" = [ 8 ];
        };
        "Mod+9" = {
          "focus-workspace" = [ 9 ];
        };
        "Mod+Shift+1" = {
          "move-column-to-workspace" = [ 1 ];
        };
        "Mod+Shift+2" = {
          "move-column-to-workspace" = [ 2 ];
        };
        "Mod+Shift+3" = {
          "move-column-to-workspace" = [ 3 ];
        };
        "Mod+Shift+4" = {
          "move-column-to-workspace" = [ 4 ];
        };
        "Mod+Shift+5" = {
          "move-column-to-workspace" = [ 5 ];
        };
        "Mod+Shift+6" = {
          "move-column-to-workspace" = [ 6 ];
        };
        "Mod+Shift+7" = {
          "move-column-to-workspace" = [ 7 ];
        };
        "Mod+Shift+8" = {
          "move-column-to-workspace" = [ 8 ];
        };
        "Mod+Shift+9" = {
          "move-column-to-workspace" = [ 9 ];
        };

        "Mod+BracketLeft" = {
          "consume-or-expel-window-left" = { };
        };
        "Mod+BracketRight" = {
          "consume-or-expel-window-right" = { };
        };
        "Mod+Comma" = {
          "consume-window-into-column" = { };
        };
        "Mod+Period" = {
          "expel-window-from-column" = { };
        };

        "Mod+R" = {
          "switch-preset-column-width" = { };
        };
        "Mod+Shift+R" = {
          "switch-preset-window-height" = { };
        };
        "Mod+Ctrl+R" = {
          "reset-window-height" = { };
        };
        "Mod+F" = {
          "maximize-column" = { };
        };
        "Mod+Shift+F" = {
          "fullscreen-window" = { };
        };
        "Mod+Ctrl+F" = {
          "expand-column-to-available-width" = { };
        };
        "Mod+C" = {
          "center-column" = { };
        };
        "Mod+Ctrl+C" = {
          "center-visible-columns" = { };
        };

        "Mod+Minus" = {
          "set-column-width" = [ "-10%" ];
        };
        "Mod+Equal" = {
          "set-column-width" = [ "+10%" ];
        };
        "Mod+Shift+Minus" = {
          "set-window-height" = [ "-10%" ];
        };
        "Mod+Shift+Equal" = {
          "set-window-height" = [ "+10%" ];
        };

        "Mod+Shift+T" = {
          "toggle-window-floating" = { };
        };
        "Mod+Shift+V" = {
          "switch-focus-between-floating-and-tiling" = { };
        };
        "Mod+W" = {
          "toggle-column-tabbed-display" = { };
        };
        "Mod+T" = {
          "toggle-column-tabbed-display" = { };
        };

        Print = {
          screenshot = { };
        };
        "Mod+S" = {
          screenshot = { };
        };
        "Mod+Shift+S" = {
          screenshot = { };
        };
        "Ctrl+Print" = {
          "screenshot-screen" = { };
        };
        "Alt+Print" = {
          "screenshot-window" = { };
        };

        "Mod+Escape" = {
          _props."allow-inhibiting" = false;
          "toggle-keyboard-shortcuts-inhibit" = { };
        };

        "Mod+Shift+E" = {
          quit = { };
        };
        "Ctrl+Alt+Delete" = {
          quit = { };
        };

        "Mod+Shift+P" = {
          "power-off-monitors" = { };
        };
      };

      # config/autostart.kdl ------------------------------------------------------
      "hotkey-overlay" = {
        "skip-at-startup" = { };
      };

      # Repeated top-level KDL nodes. Nix attrsets are unordered, so anything
      # order-sensitive (spawn order, indexed presets, repeated nodes) goes
      # through _children lists, which preserve order.
      _children = [
        # config/output.kdl
        {
          output = {
            _args = [ "eDP-1" ];
            mode = "1920x1080";
            position._props = {
              x = 0;
              y = 0;
            };
            scale = 1.0;
          };
        }
        {
          output = {
            _args = [ "HDMI-A-2" ];
            mode = "1920x1080";
            position._props = {
              x = 0;
              y = -1080;
            };
            scale = 1.0;
          };
        }

        # config/layout.kdl
        {
          layer-rule = {
            match._props."namespace" = "waybar";
            "background-effect" = {
              blur = true;
              xray = true;
            };
          };
        }
        {
          layer-rule = {
            match._props."namespace" = "wallpaper";
            "place-within-backdrop" = true;
          };
        }
        {
          window-rule = {
            "geometry-corner-radius" = 8;
            "clip-to-geometry" = true;
          };
        }

        # config/window-rules.kdl
        {
          window-rule = {
            match._props = {
              "app-id" = "firefox$";
              title = "^Picture-in-Picture$";
            };
            "open-floating" = true;
          };
        }
        {
          window-rule = {
            match._props."app-id" = "io.bassi.Amberol";
            "default-column-width" = {
              proportion = 0.25;
            };
          };
        }
        {
          window-rule = {
            match._props."app-id" = "^kitty$";
            "background-effect" = {
              blur = true;
              xray = true;
            };
          };
        }
        {
          window-rule = {
            match._props."app-id" = "zen";
            "draw-border-with-background" = false;
            "default-column-width" = {
              proportion = 0.66667;
            };
            "background-effect" = {
              blur = true;
              xray = true;
            };
          };
        }
        {
          window-rule = {
            match._props."app-id" = "thunderbird";
            "default-column-width" = {
              proportion = 0.66667;
            };
          };
        }

        # config/autostart.kdl (spawn order at startup)
        {
          spawn-at-startup._args = [
            "waybar"
            "--config"
            "/home/kav/.config/waybar/niri-config.jsonc"
          ];
        }
        { spawn-at-startup._args = [ "udiskie" ]; }
        { spawn-at-startup._args = [ "xwayland-satellite" ]; }
        {
          spawn-at-startup._args = [
            "swaybg"
            "-i"
            "/home/kav/.wallpaper"
            "-o"
            "'*'"
          ];
        }
        {
          spawn-at-startup._args = [
            "swayidle"
            "-w"
            "timeout"
            "300"
            "~/.config/sway/lock.sh"
            "timeout"
            "600"
            "niri msg action power-off-monitors"
            "timeout"
            "1200"
            "systemctl suspend-then-hibernate"
            "before-sleep"
            "~/.config/sway/lock.sh"
          ];
        }
        {
          spawn-at-startup._args = [
            "vicinae"
            "server"
            "--replace"
          ];
        }
        { spawn-at-startup._args = [ "/home/kav/.config/niri/bin/niri-layout-monitor.sh" ]; }
      ];
    };
  };
}
