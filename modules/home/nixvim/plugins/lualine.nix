{...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;

    settings = {
      options = {
        globalstatus = true;
        theme = "catppuccin";
      };

      extensions = ["oil"];

      sections = {
        lualine_a = ["mode"];
        lualine_b = ["branch" "diff"];
        lualine_c = ["diagnostics"];
        lualine_x = ["encoding" "fileformat" "filetype"];
        lualine_y = ["filesize" "progress"];
        lualine_z = ["location"];
      };

      # tabline = {
      #   lualine_a = ["buffers"];
      #   lualine_b = [""];
      #   lualine_c = [""];
      #   lualine_x = [""];
      #   lualine_y = [""];
      #   lualine_z = [""];
      # };
      #
      # winbar = {
      #   lualine_a = [
      #     ''require(lspsaga.symbol.winbar).get_bar()''
      #   ];
      #   lualine_b = [""];
      #   lualine_c = [""];
      #   lualine_x = [""];
      #   lualine_y = [""];
      #   lualine_z = [""];
      # };

      inactiveWinbar = {
        lualine_a = [""];
        lualine_b = [""];
        lualine_c = [""];
        lualine_x = [""];
        lualine_y = [""];
        lualine_z = ["filename"];
      };
    };
  };
}
