{pkgs, ...}: {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  users.users.josh = {
    extraGroups = ["wireshark"];
  };
}
