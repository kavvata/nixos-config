{
  pkgs,
  lib,
  config,
  ...
}:

let
  guiPkgs = import ./packages/gui.nix pkgs;
  cliPkgs = import ./packages/cli.nix pkgs;
  idesPkgs = import ./packages/ides.nix pkgs;
  texPkgs = import ./packages/tex.nix pkgs;
  runtimesPkgs = import ./packages/runtimes.nix pkgs;
  wmPkgs = import ./packages/wm.nix pkgs;
  k8sPkgs = import ./packages/k8s.nix pkgs;

  wms = config.my.wms;
in
{
  options.local.extraPkgs = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = [ ];
  };

  config = {
    users.users.${config.my.userName}.packages =
      guiPkgs
      ++ cliPkgs
      ++ idesPkgs
      ++ texPkgs
      ++ runtimesPkgs
      ++ k8sPkgs
      ++ lib.optionals (wms != [ ]) wmPkgs
      ++ lib.optionals (lib.elem "niri" wms) (
        with pkgs;
        [
          xwayland-satellite
          nautilus
        ]
      )
      ++ lib.optionals (lib.elem "sway" wms) (
        with pkgs;
        [
          autotiling-rs
          grim
          slurp
          nautilus
        ]
      )
      ++ config.local.extraPkgs;
  };
}
