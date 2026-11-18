{ config, lib, ... }:

let
  # Available colorschemes. Add new ones here.
  schemes = {
    oneDark = import ./schemes/oneDark.nix;
    oneLight = import ./schemes/oneLight.nix;
    solarizedLight = import ./schemes/solarizedLight.nix;
  };
in
{
  options.kav.colorscheme = lib.mkOption {
    type = lib.types.enum (lib.attrNames schemes);
    default = "oneDark";
  };

  options.colorscheme = lib.mkOption {
    type = lib.types.attrs;
    readOnly = true;
    description = "The active colorscheme; set kav.colorscheme instead.";
  };

  # The active colorscheme; dotfiles modules read this instead of
  # importing this file directly.
  config.colorscheme = schemes.${config.kav.colorscheme};
}
