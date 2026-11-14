let
  # Shared colorscheme (modules/home/kav/colors.nix)
  scheme = (import ../../colors.nix).colorscheme.colors;
in
# All color values of the niri config; the surrounding structural keys
# live in layout.nix and are merged recursively in default.nix.
{
  overview = {
    "backdrop-color" = scheme.background;
  };

  layout = {
    "background-color" = "transparent";

    focus-ring = {
      "active-color" = scheme.foreground;
      "inactive-color" = scheme.background;
      "urgent-color" = "#C4746E"; # hardcoded, not from the scheme
    };

    border = {
      "active-color" = scheme.foreground;
      "urgent-color" = "#C4746E"; # hardcoded, not from the scheme
    };

    shadow = {
      color = "#0007"; # hardcoded, not from the scheme
    };
  };
}
