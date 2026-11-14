{ pkgs, lib, config, ... }:

{
  config = {
    users.users.${config.my.userName} = {
      isNormalUser = true;
      description = "kav";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
      packages = [ pkgs.fish ];
      shell = pkgs.fish;
    };
  };
}
