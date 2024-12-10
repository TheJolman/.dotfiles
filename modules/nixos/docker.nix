{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # arion
  ];

  # Arion works with Docker, but for NixOS-based containers, you need Podman
  # since NixOS 21.05.
  virtualisation.docker.enable = true;
  # virtualisation.podman.enable = true;
  # Below option conflicts with virtualisation.docker.enable
  # virtualisation.podman.dockerSocket.enable = true;
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;

  users.users.josh.extraGroups = ["podman" "docker"];
}
