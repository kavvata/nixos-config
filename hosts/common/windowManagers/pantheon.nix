{
  pkgs,
  ...
}:
let
  commonServices = import ../packages/services.nix { };
  commonPrograms = import ../packages/programs.nix { inherit pkgs; };
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
}
