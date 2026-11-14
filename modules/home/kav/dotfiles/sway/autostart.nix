{
  config = { };

  # The old conf/autostart.conf, verbatim except the dbus line: the
  # module's systemdActivation exec (systemd.enable, default true) is its
  # superset.
  raw = builtins.readFile ./conf/autostart.conf;
}
