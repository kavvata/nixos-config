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
  services = commonServices.swayServices;
  programs = commonPrograms.swayPrograms;
  users.users.${config.local.userName} = {
    packages = userPkgs.swayPkgs;
  };
}
