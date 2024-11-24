{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {

      bookling = nixpkgs.lib.nixosSystem {
      	specialArgs = {inherit inputs;};
      	modules = [
          ./hosts/bookling/configuration.nix
        ];
      };

    };
  };
}
