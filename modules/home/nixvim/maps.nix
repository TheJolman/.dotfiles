{ ... }: {
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      # General
      {
        key = "<leader>q";
        action = "<CMD>q<CR>";
        mode = "n";
      }
      {
        key = "<leader>w";
        action = "<CMD>w<CR>";
        mode = "n";
      }
      {
        key = "<leader>wq";
        action = "<CMD>wq<CR>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<leader>v";
        action = "<CMD>vsplit<CR>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<leader>s";
        action = "<CMD>split<CR>";
        mode = "n";
        options.silent = true;
      }

      # For Buffers
      {
        key = "<leader>p";
        action = "<CMD>bp<CR>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<leader>n";
        action = "<CMD>bn<CR>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<leader>x";
        action = "<CMD>bd<CR>";
        mode = "n";
        options.silent = true;
      }

      # For Windows
      {
        key = "<leader>h";
        action = "<C-W>h";
        mode = "n";
      }
      {
        key = "<leader>l";
        action = "<C-W>l";
        mode = "n";
      }
      {
        key = "<leader>j";
        action = "<C-W>j";
        mode = "n";
      }
      {
        key = "<leader>k";
        action = "<C-W>k";
        mode = "n";
      }

      # For resizing windows
	#      {
	# key = "<C-=>";
	# action = "<C-W>=";
	#      }
      {
        key = "<C-Up>";
        action = "5<C-W>+";
        mode = "n";
      }
      {
        key = "<C-Down>";
        action = "5<C-W>-";
        mode = "n";
      }
      {
        key = "<C-Left>";
        action = "10<C-W><";
        mode = "n";
      }
      {
        key = "<C-Right>";
        action = "10<C-W>>";
        mode = "n";
      }

      # Better bind for escape in terminal mode (to move around better)
      {
        key = "<esc>";
        action = "<C-\\><C-n>";
        mode = "t";
      }

      # Oil
      {
	key = "-";
	action = "<CMD>Oil<CR>";
	mode = "n";
      }

    ];
  };
}
