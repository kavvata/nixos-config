{
  config = { };

  # `exec dbus-update-activation-environment ...` dropped: the module's
  # systemdActivation line (systemd.enable, default true) is a superset.
  raw = ''
    exec eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

    exec vicinae server --replace

    exec --no-startup-id '~/.config/sway/notify-layout-change.sh'

    exec swayidle -w \
           timeout 300 ~/.config/sway/lock.sh \
           timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
           timeout 1200 'systemctl suspend-then-hibernate' resume 'swaymsg "output * power on"' \
           before-sleep ~/.config/sway/lock.sh \
           after-resume 'swaymsg "output * power on"'

    exec --no-startup-id autotiling-rs
  '';
}
