{ config, ... }:

let
  colors = config.colorschemeResolved.colors;
in
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
        background = "${colors.background}dd";
        text = colors.foreground;
        match = colors.accent;
        selection = "${colors.selection_background}dd";
        selection-text = colors.foreground;
        selection-match = colors.accent;
        border = "${colors.border}dd";
      };

      border = {
        width = 1;
        radius = 0;
      };

    };
  };
}
