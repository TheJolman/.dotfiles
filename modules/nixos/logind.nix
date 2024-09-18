{...}: {
  # suspend or hybrid-sleep
  services.logind.handleLidSwitch = "hybrid-sleep";
  services.logind.handlePowerKey = "hibernate";
}
