colors:
# All color values of the niri config; the surrounding structural keys
# live in layout.nix and are merged recursively in default.nix.
{
  overview = {
    "backdrop-color" = colors.background;
  };

  layout = {
    "background-color" = "transparent";

    focus-ring = {
      "active-color" = colors.foreground;
      "inactive-color" = colors.background;
      "urgent-color" = "#C4746E"; # hardcoded, not from the scheme
    };

    border = {
      "active-color" = colors.foreground;
      "urgent-color" = "#C4746E"; # hardcoded, not from the scheme
    };

    shadow = {
      color = "#0007"; # hardcoded, not from the scheme
    };
  };
}
