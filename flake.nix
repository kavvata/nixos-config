{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
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
      zen-browser,
      sops-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHost = hostName: modules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.overlays = [
                (final: prev: {
                  zen-browser = zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
                })
              ];
            }
            sops-nix.nixosModules.sops
            ({ ... }: { networking.hostName = hostName; })
          ] ++ modules;
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
