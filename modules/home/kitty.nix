{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    # theme = "Gruvbox Dark";
    catppuccin.enable = true;
    font.name = "FiraCode Nerd Font";
    font.size = 14;
    shellIntegration.enableZshIntegration = true;

    settings = {
      enable_audio_bell = false;
      copy_on_select = "clipboard";
      scrollback_lines = 10000;
      window_margin_width = 10;
      background_opacity = "0.8";
    };


  };
}
