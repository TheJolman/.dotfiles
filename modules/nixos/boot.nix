{...}: {
  boot.plymouth.enable = false; # For silent boot

  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
      extraEntries = {
        "ubuntu.conf" = ''
          title Ubuntu
          efi /efi/ubuntu/shimx64.efi
        '';
      };
    };
  };
}
