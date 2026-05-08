{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      zen-browser,
      ...
    }@inputs:
    let
      overlays = [
        (import ./overlays/helium.nix)
        (final: prev: {
          zen-browser = zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
        })
      ];
    in
    {
      nixosConfigurations = {

        bookling = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            (
              { _, ... }:
              {
                nixpkgs.overlays = overlays;
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
                nixpkgs.overlays = overlays;
              }
            )
            ./hosts/think/configuration.nix
          ];
        };

      };
    };
}
