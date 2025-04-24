{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #   qemu
    #   virt-manager
    # win-virtio
    # OVMF
    # swtpm
    # tpm-tools
    # tpm2-tools
  ];

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["josh"];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };
      };
    };
    spiceUSBRedirection.enable = true;
  };

  #   virtualbox.host = {
  #     enable = true;
  #     enableExtensionPack = true;
  #   };
  # };
  # users.extraGroups.vboxusers.members = ["josh"];
}
