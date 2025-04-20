{...}: {
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      # General
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
      # Stay in indent mode while indenting
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
      # Git stuff
      {
        key = "<leader>gg";
        action = "<CMD>lua Snacks.lazygit()<CR>";
        mode = "n";
        options.desc = "Git UI";
      }
      {
        key = "<leader>ga";
        action = "<CMD>Git add .<CR>";
        mode = "n";
        options.desc = "Stage all modified files";
      }
      {
        key = "<leader>gc";
        action = "<CMD>Git commit<CR>";
        mode = "n";
        options.desc = "Git commit";
      }
      {
        key = "<leader>gp";
        action = "<CMD>Git pull<CR><CMD>checktime<CR>";
        mode = "n";
        options.desc = "Git pull";
      }
      {
        key = "<leader>gP";
        action = "<CMD>Git push<CR>";
        mode = "n";
        options.desc = "Git push";
      }
      {
        key = "<leader>gb";
        action = "<CMD>Git branch<CR>";
        mode = "n";
        options.desc = "Git branch";
      }
      {
        key = "<leader>gs";
        action = "<CMD>Git stash<CR>";
        mode = "n";
        options.desc = "Git stash";
      }
      {
        key = "<leader>gn";
        action = "<CMD>Git commit --ammend --no-edit<CR>";
        mode = "n";
        options.desc = "Ammend commmit with staged changes";
      }
      {
        key = "<leader>gr";
        action = "<CMD>Git reset --hard HEAD<CR>";
        mode = "n";
        options.desc = "Git reset to last commit";
      }
      {
        key = "<leader>gl";
        action = "<CMD>vert Git log<CR>";
        mode = "n";
        options.desc = "Git log";
      }
      {
        key = "<leader>gf";
        action = "<CMD>Git fetch<CR>";
        mode = "n";
        options.desc = "Git fetch";
      }
      {
        key = "<leader>gO";
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
      # General
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
        key = "<leader>v";
        action = "<CMD>vsplit<CR>";
        mode = "n";
        options.desc = "vertical split";
        options.silent = true;
      }
      # Buffer management
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
        key = "<leader>b";
        action = "<CMD>bd<CR>";
        mode = "n";
        options.desc = "Delete buffer";
        options.silent = true;
      }
      # Window management
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
      # Files
      {
        key = "-";
        action = "<CMD>lua MiniFiles.open()<CR>";
        mode = "n";
      }
      # Terminal
      {
        key = "<A-t>";
        action = "<cmd>lua Snacks.terminal.toggle()<CR>";
        mode = ["n" "t"];
        options.desc = "Toggle terminal";
      }

      # Picker
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
      # Lsp stuff
      {
        key = "<leader>c";
        action = "<cmd>lua Snacks.picker.qflist()<CR>";
        mode = "n";
        options.desc = "Open qflist";
      }
      # {
      #   key = "<leader>i";
      #   action = "<cmd>vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
      #   mode = "n";
      #   options.desc = "Toggle inlay hints";
      # }
      # {
      #   key = "<leader>fr";
      #   action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
      #   mode = "n";
      #   options.desc = "LSP definitions";
      # }
      # {
      #   key = "<leader>fsd";
      #   action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
      #   mode = "n";
      #   options.desc = "LSP document symbols";
      # }
      # {
      #   key = "<leader>fsw";
      #   action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
      #   mode = "n";
      #   options.desc = "LSP workspace symbols";
      # }
      # {
      #   key = "<A-d>";
      #   action = "<cmd>Trouble diagnostics toggle<cr>";
      #   mode = "n";
      #   options.desc = "Toggle diagnostics";
      # }
    ];
  };
}
