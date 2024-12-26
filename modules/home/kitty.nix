{...}: {
  programs.kitty = {
    enable = true;
    font.name = "CaskaydiaCove Nerd Font, Light";
    font.size = 14;
    shellIntegration.enableZshIntegration = true;

    settings = {
      enable_audio_bell = false;
      copy_on_select = "clipboard";
      scrollback_lines = 10000;
      window_margin_width = 10;
      background_opacity = "0.8";
      map = "super+shift+enter new_os_window_with_cwd";
      adjust_line_height = "125%";
    };
  };
}
