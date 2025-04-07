{...}: {
  services = {
    # for usb mounting
    gvfs.enable = true;
    udisks2.enable = true;

    upower.enable = true;

    printing.enable = true;
    openssh.enable = true;

    # keymap in x11
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };

    gnome.gnome-keyring.enable = true;
  };
}
