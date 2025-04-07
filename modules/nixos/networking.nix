{pkgs, ...}: {
  networking = {
    networkmanager.enable = true;

    # wireguard.enable = true;

    nat = {
      enable = true;
      enableIPv6 = true;
    };

    firewall = {
      checkReversePath = false;
    };
  };
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];
}
