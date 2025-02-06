{...}: {
  services.logind = {
    lidSwitch = "suspend"; # could also use hybrid-sleep here
    lidSwitchDocked = "ignore";
    powerKey = "poweroff";
    powerKeyLongPress = "reboot";
    # extraConfig = ''
    #   IdleAction=suspend-then-hibernate
    #   IdleActionSec=1500
    # '';
  };
}
