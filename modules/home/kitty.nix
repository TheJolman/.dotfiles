{...}: {
  programs.kitty = {
    enable = true;
    font.name = "CaskaydiaCove Nerd Font";
    font.size = 13;
    shellIntegration.enableZshIntegration = true;

    settings = {
      enable_audio_bell = false;
      copy_on_select = "clipboard";
      scrollback_lines = 10000;
      window_margin_width = 10;
      background_opacity = "0.8";
      adjust_line_height = "125%";
    };
    extraConfig = ''
      map super+shift+enter new_os_window_with_cwd

      map super+shift+j scroll_page_down
      map super+shift+k scroll_page_up

      map super+shift+l next_tab
      map super+shift+h previous_tab
      map super+shift+n new_tab
      map super+shift+' new_tab_with_cwd
      map super+shift+q close_tab
      map super+shift+1 goto_tab 1
      map super+shift+2 goto_tab 2
      map super+shift+3 goto_tab 3
      map super+shift+4 goto_tab 4
      map super+shift+5 goto_tab 5
      map super+shift+6 goto_tab 6
      map super+shift+7 goto_tab 7
      map super+shift+8 goto_tab 8
      map super+shift+9 goto_tab 9

      map super+shift+x open_url_with_hints
    '';
  };
}
