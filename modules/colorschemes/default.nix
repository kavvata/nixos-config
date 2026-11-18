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
  options.colorscheme = lib.mkOption {
    type = lib.types.enum (lib.attrNames schemes);
    default = "oneDark";
    description = "The active colorscheme for the dotfiles.";
  };

  # The resolved colorscheme; dotfiles modules read this instead of
  # importing the schemes directly.
  options.colorschemeResolved = lib.mkOption {
    type = lib.types.attrs;
    readOnly = true;
    description = "The resolved colorscheme; set colorscheme instead.";
  };

  config.colorschemeResolved = schemes.${config.colorscheme};
}
