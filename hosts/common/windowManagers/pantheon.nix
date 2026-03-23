{
  pkgs,
  config,
  ...
}:
let
  commonServices = import ../packages/services.nix { };
  commonPrograms = import ../packages/programs.nix { inherit pkgs; };
  userPkgs = import ../packages/user_packages.nix { inherit pkgs; };
in
{
  i18n = {
    inputMethod.type = "ibus";
    inputMethod.enable = true;
  };
  services = commonServices.defaultServices // {
    xserver = {
      enable = true;
      displayManager.lightdm.greeters.pantheon.enable = true;
    };

    desktopManager.pantheon.enable = true;

  };
  programs = commonPrograms.defaultPrograms;

  users.users.${config.local.userName} = {
    packages = userPkgs.niriPkgs;
  };
}
