{...}: {
  security.polkit.enable = true;

  security.pam.services.swaylock = {
    fprintAuth = true;
    text = ''
      auth sufficient pam_unix.so try_first_pass likeauth nullok
      auth sufficient pam_fprintd.so
      auth include login

    '';
  };
  # security.pam.services.swaylock.fprintAuth = true;
  security.pam.services.hyprlock = {
    fprintAuth = true;
  };
}
