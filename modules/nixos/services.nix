{...}: {
  services = {
    # for usb mounting
    gvfs.enable = true;
    udisks2.enable = true;

    printing.enable = true;
    openssh.enable = true;

    # keymap in x11
    services.xserver = {
      xkb.layout = "us";
      xkb.variant = "";
    };
  };
}
