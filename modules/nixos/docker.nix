{...}: {
  virtualisation.docker.enable = true;
  services.kali-docker = {
    enable = true;
    extraPackages = [ "neovim" ];
  };
}
