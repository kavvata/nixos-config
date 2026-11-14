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

  # Raw sway text, concatenated in the old include order (config,
  # autostart, binds, input, output, window-rules, swayfx); layout carries
  # no raw text. Nix strips the first newline of each indented string, so
  # the separator restores the blank line between sections; each raw ends
  # with a newline.
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

    # The system config installs swayfx with the gtk wrapper; the module
    # needs its own package for build-time validation and `swaymsg reload`
    # on config change.
    package = pkgs.swayfx.override { withGtkWrapper = true; };

    # checkPhase runs sway under xvfb, where swayfx's fx_renderer cannot
    # create a renderer ("no DRM FD available") regardless of the config's
    # correctness; verified live in a real session instead.
    checkConfig = false;

    config = swayConfig;
    inherit extraConfig;
  };
}
