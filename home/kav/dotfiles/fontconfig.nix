# NOTE: the fonts.fontconfig HM module is not usable here — it writes to
# ~/.config/fontconfig/conf.d/, which this fontconfig (2.18.3) does not read
# at all (verified: per-user conf.d is ignored even without fonts.conf).
# The per-user config file is ~/.config/fontconfig/fonts.conf, so it is
# managed as a verbatim file.
{
  home.file."config/fontconfig/fonts.conf".source = ./fontconfig/fonts.conf;
}
