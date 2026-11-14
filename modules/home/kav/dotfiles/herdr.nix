{
  programs.herdr = {
    enable = true;

    settings = {
      onboarding = false;

      theme = {
        name = "one-dark";
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
