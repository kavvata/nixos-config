{
  _children = [
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
  ];
}
