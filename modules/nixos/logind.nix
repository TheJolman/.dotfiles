{...}: {
  services.logind = {
    lidSwitch = "suspend"; # could also use hybrid-sleep here
    lidSwitchDocked = "ignore";
    powerKey = "hibernate";
    powerKeyLongPress = "reboot";
  };
}