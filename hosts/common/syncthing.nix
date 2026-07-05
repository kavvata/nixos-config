{ pkgs, lib, config, ... }:

let
  inherit (config.my) userName;
in {
  options.syncthing = {
    devices = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options.id = lib.mkOption { type = lib.types.str; };
      });
      default = { };
    };
    folders = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          id = lib.mkOption { type = lib.types.str; };
          path = lib.mkOption { type = lib.types.str; };
          devices = lib.mkOption { type = lib.types.listOf lib.types.str; };
          ignorePatterns = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ ];
          };
        };
      });
      default = { };
    };
  };

  config = lib.mkIf (config.syncthing.devices != { }) {
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = userName;
      configDir = "/home/${userName}/.config/syncthing";
      settings = {
        inherit (config.syncthing) devices folders;
      };
    };
  };
}
