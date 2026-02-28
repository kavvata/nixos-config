{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.local.userName = lib.mkOption {
    type = lib.types.str;
    default = "kav";
  };
  config = {
    users.users.${config.local.userName} = {
      isNormalUser = true;
      description = "kav";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
      shell = pkgs.fish;
    };
  };
}
