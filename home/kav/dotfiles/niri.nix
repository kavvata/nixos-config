{ pkgs, lib, ... }:

let
  config = import ./niri/config.nix;
  input = import ./niri/input.nix;
  output = import ./niri/output.nix;
  layout = import ./niri/layout.nix;
  windowRules = import ./niri/window-rules.nix;
  animations = import ./niri/animations.nix;
  binds = import ./niri/binds.nix;
  autostart = import ./niri/autostart.nix;

  # Order of repeated top-level nodes, mirroring the old config.kdl include
  # order (output, layout, window-rules, autostart).
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

    # Top-level keys are unique per fragment, so `//` merges are safe.
    settings =
      config
      // input
      // (removeAttrs layout [ "_children" ])
      // (removeAttrs autostart [ "_children" ])
      // animations
      // binds
      // {
        _children = orderedChildren;
      };
  };
}
