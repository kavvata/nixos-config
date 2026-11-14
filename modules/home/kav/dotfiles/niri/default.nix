{ pkgs, lib, ... }:

let
  config = import ./config.nix;
  input = import ./input.nix;
  output = import ./output.nix;
  layout = import ./layout.nix;
  colors = import ./colors.nix;
  windowRules = import ./window-rules.nix;
  animations = import ./animations.nix;
  binds = import ./binds.nix;
  autostart = import ./autostart.nix;

  orderedChildren = lib.flatten [
    output._children
    layout._children
    windowRules._children
    autostart._children
  ];
in
{
  wayland.windowManager.niri = {
    enable = true;

    # NOTE:
    # Only needed so the module's checkConfig runs `niri validate --config`
    # at build time; the system config already provides the runtime package.
    package = pkgs.niri;

    settings =
      config
      // input
      // (lib.recursiveUpdate (removeAttrs layout [ "_children" ]) colors)
      // (removeAttrs autostart [ "_children" ])
      // animations
      // binds
      // {
        _children = orderedChildren;
      };
  };
}
