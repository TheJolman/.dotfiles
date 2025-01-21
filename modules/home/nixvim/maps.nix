{...}: {
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      # General
      {
        key = "p";
        action = "\"_dP";
        mode = "v";
        options.desc = "Better paste";
      }
      {
        key = "<M-j>";
        action = ":m '>+1<CR>gv=gv";
        mode = "v";
        options.desc = "Move text down";
      }
      {
        key = "<M-k>";
        action = ":m '<-2<CR>gv=gv";
        mode = "v";
        options.desc = "Move text up";
      }
      # Stay in indent mode
      {
        key = "<";
        action = "<gv";
        mode = "v";
      }
      {
        key = ">";
        action = ">gv";
        mode = "v";
      }
      {
        key = "<leader>gg";
        action = "<CMD>lua require('neogit').open({ kind = 'floating' })<CR>";
        mode = "n";
        options.desc = "Open Neogit";
      }
      {
        key = "<leader>gd";
        action = "<CMD>DiffviewOpen<CR>";
        mode = "n";
        options.desc = "Open Diffview";
      }
      {
        key = "<leader>gq";
        action = "<CMD>DiffviewClose<CR>";
        mode = "n";
        options.desc = "Close Diffview";
      }
      {
        key = "<leader>gl";
        action = "<CMD>DiffviewClose<CR>";
        mode = "n";
        options.desc = "Close Diffview";
      }
      {
        key = "<leader>gh";
        action = "<CMD>DiffviewFileHistory<CR>";
        mode = "n";
        options.desc = "Git file history";
      }
      {
        key = "<leader>q";
        action = "<CMD>q<CR>";
        mode = "n";
        options.desc = "quit";
      }
      {
        key = "<leader>w";
        action = "<CMD>w<CR>";
        mode = "n";
        options.desc = "save";
      }
      {
        key = "<leader>wq";
        action = "<CMD>wq<CR>";
        mode = "n";
        options.desc = "save+quit";
        options.silent = true;
      }
      {
        key = "<leader>v";
        action = "<CMD>vsplit<CR>";
        mode = "n";
        options.desc = "vertical split";
        options.silent = true;
      }
      {
        key = "<leader>s";
        action = "<CMD>split<CR>";
        mode = "n";
        options.desc = "horizontal split";
        options.silent = true;
      }

      # For Buffers
      {
        key = "<leader>p";
        action = "<CMD>bp<CR>";
        mode = "n";
        options.desc = "prev buffer";
        options.silent = true;
      }
      {
        key = "<leader>n";
        action = "<CMD>bn<CR>";
        mode = "n";
        options.desc = "next buffer";
        options.silent = true;
      }
      {
        key = "<leader>x";
        action = "<CMD>bd<CR>";
        mode = "n";
        options.desc = "delete buffer";
        options.silent = true;
      }

      # For Windows
      {
        key = "<leader>h";
        action = "<C-W>h";
        mode = "n";
        options.desc = "move left";
      }
      {
        key = "<leader>l";
        action = "<C-W>l";
        mode = "n";
        options.desc = "move right";
      }
      {
        key = "<leader>j";
        action = "<C-W>j";
        mode = "n";
        options.desc = "move down";
      }
      {
        key = "<leader>k";
        action = "<C-W>k";
        mode = "n";
        options.desc = "move up";
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
        action = "<CMD>lua MiniFiles.open()<CR>";
        mode = "n";
      }

      # Toggleterm
      {
        key = "<A-1>";
        action = "<cmd>ToggleTerm 1 direction=horizontal<CR>";
        mode = "n";
        options.desc = "toggle term 1";
      }
      {
        key = "<A-1>";
        action = "<cmd>ToggleTerm 1 direction=horizontal<CR>";
        mode = "t";
      }
      {
        key = "<A-2>";
        action = "<cmd>ToggleTerm 2 direction=horizontal<CR>";
        mode = "n";
        options.desc = "toggle term 2";
      }
      {
        key = "<A-2>";
        action = "<cmd>ToggleTerm 2 direction=horizontal<CR>";
        mode = "t";
        options.desc = "toggle term 2";
      }
      {
        key = "<A-3>";
        action = "<cmd>ToggleTerm 3 direction=horizontal<CR>";
        mode = "n";
        options.desc = "toggle term 3";
      }
      {
        key = "<A-3>";
        action = "<cmd>ToggleTerm 3 direction=horizontal<CR>";
        mode = "t";
        options.desc = "toggle term 3";
      }
      {
        key = "<A-f>";
        action = "<cmd>ToggleTerm 10 direction=float<CR>";
        mode = "n";
        options.desc = "toggle float term";
      }
      {
        key = "<A-f>";
        action = "<cmd>ToggleTerm 10 direction=float<CR>";
        mode = "t";
        options.desc = "toggle float term";
      }

      # fzf-lua
      {
        key = "<leader>ff";
        action = "<cmd>FzfLua files<CR>";
        mode = "n";
        options.desc = "fzf files";
      }
      {
        key = "<leader>fb";
        action = "<cmd>FzfLua buffers<CR>";
        mode = "n";
        options.desc = "fzf buffers";
      }
      {
        key = "<leader>fg";
        action = "<cmd>FzfLua grep<CR>";
        mode = "n";
        options.desc = "fzf grep";
      }
      {
        key = "<leader>fv";
        action = "<cmd>FzfLua grep_visual<CR>";
        mode = "n";
        options.desc = "fzf visual selection";
      }
      {
        key = "<leader>fw";
        action = "<cmd>FzfLua grep_cword<CR>";
        mode = "n";
        options.desc = "fzf word under cursor";
      }
    ];
  };
}
