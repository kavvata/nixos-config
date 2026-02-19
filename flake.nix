{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {

        bookling = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            (
              { _, ... }:
              {
                nixpkgs.overlays = [ (import ./overlays/helium.nix) ];
              }
            )
            ./hosts/bookling/configuration.nix
          ];
        };
        think = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            (
              { _, ... }:
              {
                nixpkgs.overlays = [ (import ./overlays/helium.nix) ];
              }
            )
            ./hosts/think/configuration.nix
          ];
        };

      };
    };
}
