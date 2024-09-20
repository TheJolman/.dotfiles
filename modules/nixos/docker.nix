{...}: {
  virtualisation.docker.enable = true;
  services.kali-docker = {
    enable = true;
    extraPackages = [ "neovim" "kali-linux-default" ];
    users = [ "josh" ];
  };
}
