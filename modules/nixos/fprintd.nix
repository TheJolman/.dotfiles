{...}: {
  # fingerprint reader
  services.fprintd = {
    enable = true;
    # tod.enable = true;
  };
  # this might speed it up by starting driver at system start
  systemd.services.fprintd = {
    wantedBy = ["multi-user.target"];
    serviceConfig.Type = "simple";
  };
}
