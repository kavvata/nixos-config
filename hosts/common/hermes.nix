{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/hermes.yaml;
    age.keyFile = "/home/kav/.config/sops/age/keys.txt";
    secrets."hermes-env" = {
      format = "yaml";
    };
  };

  services.hermes-agent = {
    enable = true;
    settings.model.default = "anthropic/claude-sonnet-4";
    environmentFiles = [ config.sops.secrets."hermes-env".path ];
    addToSystemPackages = true;
  };

  # Needed to (re)encrypt secrets: sops edit secrets/hermes.yaml (from the repo root)
  environment.systemPackages = [ pkgs.sops ];
}
