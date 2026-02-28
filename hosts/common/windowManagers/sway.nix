{ pkgs, ... }:
let
  commonServices = import ../packages/services.nix { };
  commonPrograms = import ../packages/programs.nix { inherit pkgs; };
in
{
  services = commonServices.swayServices;
  programs = commonPrograms.swayPrograms;
}
