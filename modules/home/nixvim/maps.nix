{...}: {
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      # =================== General ===================
      {
        key = "<leader>w";
        action = "<CMD>w<CR>";
        mode = "n";
        options.desc = "save";
      }
      {
        key = "<leader>m";
        action = "<CMD>make<CR>";
        mode = "n";
        options.desc = "make";
      }
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
      {
        key = "<";
        action = "<gv";
        mode = "v";
        options.desc = "Visual mode continuous indenting";
      }
      {
        key = ">";
        action = ">gv";
        mode = "v";
        options.desc = "Visual mode continuous indenting";
      }

      # =================== Git related ===================
      {
        key = "<leader>gg";
        action = "<CMD>lua Snacks.lazygit()<CR>";
        mode = "n";
        options.desc = "Git UI";
      }
      {
        key = "<leader>gl";
        action = "<CMD>lua Snacks.picker.git_log()<CR>";
        mode = "n";
        options.desc = "Git log";
      }
      {
        key = "<leader>gb";
        action = "<CMD>lua Snacks.git.blame_line()<CR>";
        mode = "n";
        options.desc = "Git blame current line";
      }
      {
        key = "<leader>go";
        action = "<CMD>lua Snacks.gitbrowse()<CR>";
        mode = "n";
        options.desc = "Open repo in browswer";
      }
      {
        key = "<leader>do";
        action = "<CMD>DiffviewOpen<CR>";
        mode = "n";
        options.desc = "Open Diffview";
      }
      {
        key = "<leader>dq";
        action = "<CMD>DiffviewClose<CR>";
        mode = "n";
        options.desc = "Close Diffview";
      }
      {
        key = "<leader>dh";
        action = "<CMD>DiffviewFileHistory<CR>";
        mode = "n";
        options.desc = "Git file history";
      }

      # =================== Buffer management ===================
      {
        key = "[b";
        action = "<CMD>bp<CR>";
        mode = "n";
        options.desc = "prev buffer";
        options.silent = true;
      }
      {
        key = "]b";
        action = "<CMD>bn<CR>";
        mode = "n";
        options.desc = "next buffer";
        options.silent = true;
      }
      {
        key = "<leader>b";
        action = "<CMD>lua Snacks.bufdelete()<CR>";
        mode = "n";
        options.desc = "Delete buffer";
        options.silent = true;
      }

      # =================== Tab management ===================
      {
        key = "[t";
        action = "<CMD>tabprevious<CR>";
        mode = "n";
        options.desc = "prev tab";
        options.silent = true;
      }
      {
        key = "]t";
        action = "<CMD>tabnext<CR>";
        mode = "n";
        options.desc = "next tab";
        options.silent = true;
      }
      {
        key = "<leader>to";
        action = "<CMD>tabnew<CR>";
        mode = "n";
        options.desc = "New tab";
      }
      {
        key = "<leader>tc";
        action = "<CMD>tabclose<CR>";
        mode = "n";
        options.desc = "close tab";
      }

      # =================== Window management ===================
      {
        key = "<leader>v";
        action = "<CMD>vsplit<CR>";
        mode = "n";
        options.desc = "vertical split";
        options.silent = true;
      }
      {
        key = "<leader>h";
        action = "<C-W>h";
        mode = "n";
        options.desc = "Move left";
      }
      {
        key = "<leader>l";
        action = "<C-W>l";
        mode = "n";
        options.desc = "Move right";
      }
      {
        key = "<leader>j";
        action = "<C-W>j";
        mode = "n";
        options.desc = "Move down";
      }
      {
        key = "<leader>k";
        action = "<C-W>k";
        mode = "n";
        options.desc = "Move up";
      }
      {
        key = "<C-Up>";
        action = "5<C-W>+";
        mode = "n";
        options.desc = "Increase window height";
      }
      {
        key = "<C-Down>";
        action = "5<C-W>-";
        mode = "n";
        options.desc = "Decrease window height";
      }
      {
        key = "<C-Right>";
        action = "10<C-W>>";
        mode = "n";
        options.desc = "Increase window width";
      }
      {
        key = "<C-Left>";
        action = "10<C-W><";
        mode = "n";
        options.desc = "Decrease window width";
      }

      # =================== File explorer (Mini) ===================
      {
        key = "-";
        action = "<CMD>lua MiniFiles.open()<CR>";
        mode = "n";
      }

      # =================== Terminal (Snacks) ===================
      {
        key = "<A-t>";
        action = "<cmd>lua Snacks.terminal.toggle()<CR>";
        mode = ["n" "t"];
        options.desc = "Toggle terminal";
      }

      # =================== Picker (Snacks) ===================
      {
        key = "<leader>ff";
        action = "<cmd>lua Snacks.picker.files()<CR>";
        mode = "n";
        options.desc = "Pick files";
      }
      {
        key = "<leader>fb";
        action = "<cmd>lua Snacks.picker.buffers()<CR>";
        mode = "n";
        options.desc = "Pick buffers";
      }
      {
        key = "<leader>fg";
        action = "<cmd>lua Snacks.picker.grep()<CR>";
        mode = "n";
        options.desc = "Grep";
      }
      {
        key = "<leader>fw";
        action = "<cmd>lua Snacks.picker.grep_word()<CR>";
        mode = "n";
        options.desc = "Grep word under cursor";
      }

      # =================== Quickfix list ===================
      {
        key = "<leader>qo";
        action = "<cmd>copen<CR>";
        mode = "n";
        options.desc = "Open qflist";
      }
      {
        key = "<leader>qc";
        action = "<cmd>cclose<CR>";
        mode = "n";
        options.desc = "Open qflist";
      }
      {
        key = "]q";
        action = "<cmd>cnext<CR>";
        mode = "n";
      }
      {
        key = "[q";
        action = "<cmd>cprev<CR>";
        mode = "n";
      }
    ];
  };
}
