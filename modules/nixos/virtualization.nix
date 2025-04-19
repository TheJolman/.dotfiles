{...}: {
  virtualisation.virtualbox.host = {
    enable = false;
    enableExtensionPack = true;
  };
  users.extraGroups.vboxusers.members = ["josh"];
}
