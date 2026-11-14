{
  programs.kitty = {
    enable = true;

    font = {
      name = "Iosevka Nerd Font";
      size = 10.0;
    };

    settings = {
      window_padding_width = 3;
      enable_audio_bell = false;
      background_opacity = 0.9;
      resize_debounce_time = 0;
      update_check_interval = 0;
      remember_window_size = false;
      initial_window_width = 640;
      initial_window_height = 540;
      notify_on_cmd_finish = "unfocused 60";
    };

    keybindings = {
      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+shift+n" = "new_os_window_with_cwd";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+0" = "change_font_size all 0";
      "shift+alt+," = "load_config_file '/home/kav/.config/kitty/kitty.conf'";
    };

    autoThemeFiles = {
      dark = "OneDark";
      light = "Solarized_Light";
      noPreference = "OneDark";
    };
  };
}
