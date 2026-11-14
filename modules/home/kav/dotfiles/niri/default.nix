{ pkgs, lib, ... }:

let
  config = import ./config.nix;
  input = import ./input.nix;
  output = import ./output.nix;
  layout = import ./layout.nix;
  windowRules = import ./window-rules.nix;
  animations = import ./animations.nix;
  binds = import ./binds.nix;
  autostart = import ./autostart.nix;

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
