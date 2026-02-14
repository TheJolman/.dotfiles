{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    types
    ;
  cfg = config.laptop;
in {
  options.laptop = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enables laptop specific settings, like power profiles and lid switch behavior.
      '';
    };
    enableFingerprintReader = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enables fprintd.
      '';
    };
  };

  config = {
    services.power-profiles-daemon = mkIf cfg.enable {
      enable = false;
    };
    services.auto-cpufreq = mkIf cfg.enable {
      enable = true;
    };

    services.logind.settings.Login = mkIf cfg.enable {
      HandleLidSwitch = "suspend";
      HandleLidSwitchDocked = "ignore";
      HandlePowerKey = "poweroff";
    };

    services.fprintd = mkIf cfg.enableFingerprintReader {
      enable = true;
      # tod.enable = true;
    };
    # this might speed it up by starting driver at system start
    systemd.services.fprintd = mkIf cfg.enableFingerprintReader {
      wantedBy = ["multi-user.target"];
      serviceConfig.Type = "simple";
    };
  };
}
