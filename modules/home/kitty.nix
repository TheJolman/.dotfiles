{...}: {
  programs.kitty = {
    enable = true;
    # font.name = "CaskaydiaCove Nerd Font";
    font.name = "ZedMono Nerd Font";
    font.size = 13;
    shellIntegration.enableZshIntegration = true;
    themeFile = "cherry-midnight";

    settings = {
      enable_audio_bell = false;
      copy_on_select = "clipboard";
      scrollback_lines = 10000;
      window_margin_width = 0;
      window_padding_width = 5;
      background_opacity = "0.9";
      background_blur = 32;
      adjust_line_height = "120%";
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      notify_on_cmd_finish = "unfocused";
      term = "xterm-kitty"; # this is xterm-256color when I checked for some reason?
    };
    extraConfig = ''
      map super+shift+enter new_os_window_with_cwd

      map super+shift+j scroll_page_down
      map super+shift+k scroll_page_up

      map super+shift+n next_tab
      map super+shift+p previous_tab
      map super+' new_tab
      map super+shift+' new_tab_with_cwd
      map super+shift+. move_tab_forward
      map super+shift+, move_tab_backward
      map super+shift+q close_tab
      map alt+1 goto_tab 1
      map alt+2 goto_tab 2
      map alt+3 goto_tab 3
      map alt+4 goto_tab 4
      map alt+5 goto_tab 5
      map alt+6 goto_tab 6
      map alt+7 goto_tab 7
      map alt+8 goto_tab 8
      map alt+9 goto_tab 9

      map super+shift+x open_url_with_hints
    '';
  };
}
