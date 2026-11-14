{
  config = {
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
  };

  raw = "";
}
