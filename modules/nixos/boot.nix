{...}: {
  boot.plymouth.enable = false; # For silent boot

  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
    };
  };
}
