{
  config = {
    # The workspace name is rendered verbatim, hence "workspace number N".
    # Keys sort with 10 before 9, matching the old include order (first
    # match wins).
    assigns."workspace number 10" = [ { app_id = "legcord"; } ];
    assigns."workspace number 9" = [ { app_id = "com.mastermindzh.tidal-hifi"; } ];
  };

  raw = "";
}
