{ pkgs, lib, config, ... }:

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  wms = config.my.wms;
  session =
    if lib.elem "sway" wms then "sway"
    else if lib.elem "pantheon" wms then "pantheon"
    else "niri-session";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --remember-session --cmd ${session}";
        user = "greeter";
      };
    };
  };

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  services.dbus.packages = [
    pkgs.gnome-keyring
    pkgs.gcr
  ];

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
