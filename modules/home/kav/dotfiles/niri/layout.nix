let
  colors = (import ../../colors.nix).colorscheme.colors;
in
{
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

  # Repeated top-level nodes; see niri.nix for the concatenation order.
  _children = [
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
  ];
}
