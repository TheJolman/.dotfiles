{pkgs, ...}: {
  # Enable interception tools
  services.interception-tools = {
    enable = true;
    plugins = with pkgs.interception-tools-plugins; [
      dual-function-keys
      caps2esc
    ];
    udevmonConfig = ''
      - JOB: >
          ${pkgs.interception-tools}/bin/intercept -g $DEVNODE |
          ${pkgs.interception-tools-plugins.caps2esc}/bin/caps2esc |
          ${pkgs.interception-tools}/bin/uinput -d $DEVNODE
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
    '';
  };

  # Create the dual-function-keys configuration file
  # https://github.com/torvalds/linux/blob/master/include/uapi/linux/input-event-codes.h
  # environment.etc."dual-function-keys.yaml".text = ''
  #   TIMING:
  #     TAP_MILLISEC: 200
  #     DOUBLE_TAP_MILLISEC: 150
  #
  #   MAPPINGS:
  #     # - KEY: KEY_CAPSLOCK
  #     #   TAP: KEY_ESC
  #     #   HOLD: KEY_LEFTCTRL
  #     - KEY: KEY_RIGHTSHIFT
  #       TAP: KEY_BACKSPACE
  #       # HOLD: KEY_BACKSPACE
  # '';
}
