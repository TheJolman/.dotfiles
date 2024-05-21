{ ... }: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    theme = "catppuccin";

    sections = {
      lualine_a = ["mode"];
      lualine_b = ["branch" "diff"];
      lualine_c = [
	"buffers"
	# {
	#   mode = 0;
	  # use_mode_colors = true;
	  # buffers_color = {
	  # };

	# }
      ];
      lualine_x = ["diagnostics" "filetype"];
      lualine_z = ["location"];
    };
  };
}
