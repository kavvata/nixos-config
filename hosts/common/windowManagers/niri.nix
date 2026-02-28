{
  pkgs,
  lib,
  config,
  ...
}:
let
  commonServices = import ../packages/services.nix { };
  commonPrograms = import ../packages/programs.nix { inherit pkgs; };
  userPkgs = import ../packages/user_packages.nix { inherit pkgs; };
in
{
  options.local.userName = lib.mkOption {
    type = lib.types.str;
    default = "kav";
  };
  config = {
    services = commonServices.niriServices;
    programs = commonPrograms.niriPrograms;
    users.users.${config.local.userName} = {
      packages = userPkgs.niriPkgs;
    };
  };
}
