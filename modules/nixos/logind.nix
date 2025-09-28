{...}: {
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend"; # could also use hybrid-sleep here
    HandleLidSwitchDocked = "ignore";
    HandlePowerKey = "poweroff";
  };
}
