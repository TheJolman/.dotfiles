{
  # pkgs,
  user,
  ...
}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["${user}"];

  virtualisation = {
    libvirtd = {
      enable = true;
      # qemu = {
      #   ovmf = {
      #     enable = true;
      #     packages = [pkgs.OVMFFull.fd];
      #   };
      # };
    };
    spiceUSBRedirection.enable = true;
  };
}
