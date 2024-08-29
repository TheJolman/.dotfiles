{ pkgs, lib, ... }: {

  options = {
    gaming.enable = 
      lib.mkEnableOption "enables Steam and gaming optimizations";
  };

  config = {
    hardware.opengl = {
      enable = true;
    };

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    services.xserver.videoDrivers = ["amdgpu"];
    programs.gamemode.enable = true;
    hardware.xone.enable = true;
  };

}
