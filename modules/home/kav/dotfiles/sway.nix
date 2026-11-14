{ pkgs, lib, ... }:

let
  config = import ./sway/config.nix;
  layout = import ./sway/layout.nix;
  autostart = import ./sway/autostart.nix;
  binds = import ./sway/binds.nix;
  input = import ./sway/input.nix;
  output = import ./sway/output.nix;
  windowRules = import ./sway/window-rules.nix;
  swayfx = import ./sway/swayfx.nix;

  # Top-level keys are unique per fragment, so merging with `//` is safe.
  swayConfig =
    config.config
    // layout.config
    // autostart.config
    // binds.config
    // input.config
    // output.config
    // windowRules.config
    // swayfx.config;

  extraConfig = lib.concatStringsSep "\n" (
    lib.remove "" [
      config.raw
      layout.raw
      autostart.raw
      binds.raw
      input.raw
      output.raw
      windowRules.raw
      swayfx.raw
    ]
  );
in
{
  wayland.windowManager.sway = {
    enable = true;

    package = pkgs.swayfx.override { withGtkWrapper = true; };

    # checkPhase runs sway under xvfb, where swayfx's fx_renderer cannot
    # create a renderer ("no DRM FD available") regardless of the config's
    # correctness; verified live in a real session instead.
    checkConfig = false;

    config = swayConfig;
    inherit extraConfig;
  };
}
