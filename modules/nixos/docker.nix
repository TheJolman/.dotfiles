{...}: {
  virtualisation.docker.enable = true;
  services.kali-docker = {
    enable = false;
    extraPackages = [ "neovim" "kali-linux-default" ];
    users = [ "josh" ];
  };
}
