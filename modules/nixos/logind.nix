{...}: {
  # suspend or hybrid-sleep
  services.logind.lidSwitch = "hybrid-sleep";
  services.logind.lidSwitchDocked = "ignore";
  services.logind.powerKey = "hibernate";
}
