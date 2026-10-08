{
  description = "Nixos config flake";

  nixConfig = {
    # Prebuilt NARs for llm-agents.nix packages (their daily CI builds the
    # full package set; nixConfig only applies to the root flake, so the
    # substituters must be declared here for nixos-rebuild to substitute).
    extra-substituters = [ "https://cache.numtide.com" ];
    extra-trusted-public-keys = [ "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    llm-agents = {
      url = "github:numtide/llm-agents.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      llm-agents,
      zen-browser,
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
                  zen-browser = zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
                  helium = helium.packages.${prev.stdenv.hostPlatform.system}.default;
                  # Taken from llm-agents' own prebuilt package set (not their
                  # shared-nixpkgs overlay) so the store path matches what
                  # cache.numtide.com serves — substituting, not compiling.
                  hermes-agent = llm-agents.packages.${prev.stdenv.hostPlatform.system}.hermes-agent;
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
