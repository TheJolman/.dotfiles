{pkgs, ...}: {
  virtualisation.vmware = {
    host.enable = true;
    guest.enable = true;
  };
  environment.systemPackages = with pkgs; [open-vm-tools];
  services.xserver.videoDrivers = ["vmware"];
}
