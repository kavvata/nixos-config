{ config, ... }:
let
  herdrTheme = config.colorschemeResolved.herdrTheme;
in
{
  programs.herdr = {
    enable = true;

    settings = {
      onboarding = false;

      theme = {
        name = herdrTheme;
        auto_switch = false;
      };

      ui = {
        status_indicators = "dots";
        toast = {
          delivery = "system";
        };
      };

      remote = {
        manage_ssh_config = true;
      };
    };
  };
}
