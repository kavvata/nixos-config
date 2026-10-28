{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      helium,
      sops-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHost =
        hostName: modules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.overlays = [
                (final: prev: {
                  helium = helium.packages.${prev.stdenv.hostPlatform.system}.default;
                  # Taken from llm-agents' own prebuilt package set (not their
                  # shared-nixpkgs overlay) so the store path matches what
                  # cache.numtide.com serves — substituting, not compiling.
                })
              ];
            }
            sops-nix.nixosModules.sops
            ({ ... }: { networking.hostName = hostName; })
          ]
          ++ modules;
        };
    in
    {
      formatter.${system} = pkgs.nixfmt;

      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.nixfmt ];
      };

      nixosConfigurations = {
        bookling = mkHost "bookling" [
          ./hosts/bookling/configuration.nix
        ];
        think = mkHost "think" [
          ./hosts/think/configuration.nix
        ];
      };
    };
}
