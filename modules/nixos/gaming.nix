{...}: {
  hardware.graphics = {
    enable = true;
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  programs.gamemode.enable = true;
  hardware.xone.enable = true;
}
