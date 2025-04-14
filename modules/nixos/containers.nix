{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # arion
    podman-tui
    docker-compose
    podman-compose
    pods
  ];

  # Arion works with Docker, but for NixOS-based containers, you need Podman
  # since NixOS 21.05.
  virtualisation = {
    docker.enable = true;
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  # virtualisation.podman.enable = true;
  # Below option conflicts with virtualisation.docker.enable
  # virtualisation.podman.dockerSocket.enable = true;

  users.users.josh.extraGroups = ["podman" "docker"];
}
