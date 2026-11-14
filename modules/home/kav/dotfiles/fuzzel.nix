{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "Inter:size=8:weight=200,JetBrainsMono Nerd Font:size=9";
        dpi-aware = "no";
        # NOTE:
        # nerd font glyph U+E68F (bytes EE 9A 8F) + three trailing spaces,
        # quoted so fuzzel does not trim them
        prompt = "\"   \"";
        icons-enabled = "no";
        lines = 4;
        width = 20;
        horizontal-pad = 20;
        line-height = 16;
      };

      colors = {
        background = "191919dd";
        text = "DCD7BAff";
        match = "#E46876ff";
        selection = "2A2A37dd";
        selection-text = "DCD7BAff";
        selection-match = "#E46876ff";
        border = "BBBBBBdd";
      };

      border = {
        width = 1;
        radius = 4;
      };

    };
  };
}
