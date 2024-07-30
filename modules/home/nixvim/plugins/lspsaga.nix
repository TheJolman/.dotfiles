{...}: {
  programs.nixvim.plugins.lspsaga = {
    enable = true;
    beacon.enable = true;
    symbolInWinbar.enable = false;
    extraOptions = {

    };
  };
}
