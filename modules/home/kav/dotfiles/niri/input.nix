{
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
}
