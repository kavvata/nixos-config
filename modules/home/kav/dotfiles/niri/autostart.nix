{
  "hotkey-overlay" = {
    "skip-at-startup" = { };
  };

  _children = [
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
}
