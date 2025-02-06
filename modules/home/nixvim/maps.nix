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
        # action = "<CMD>lua require('neogit').open({ kind = 'floating' })<CR>";
        mode = "n";
        options.desc = "Git UI";
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
        key = "<leader>x";
        action = "<CMD>bd<CR>";
        mode = "n";
        options.desc = "delete buffer";
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
      {
        key = "<A-f>";
        action = "<cmd>lua Snacks.terminal.open('zsh')<CR>";
        mode = "n";
        options.desc = "Open floating terminal";
      }
      {
        key = "<A-1>";
        action = "<cmd>lua Snacks.terminal.open()<CR>";
        mode = "n";
        options.desc = "Open new terminal";
      }
      # fzf-lua
      {
        key = "<leader>ff";
        action = "<cmd>FzfLua files<CR>";
        mode = "n";
        options.desc = "Pick files";
      }
      {
        key = "<leader>fb";
        action = "<cmd>FzfLua buffers<CR>";
        mode = "n";
        options.desc = "Pick buffers";
      }
      {
        key = "<leader>fg";
        action = "<cmd>FzfLua grep<CR>";
        mode = "n";
        options.desc = "Grep";
      }
      {
        key = "<leader>fv";
        action = "<cmd>FzfLua grep_visual<CR>";
        mode = "n";
        options.desc = "Visual grep";
      }
      {
        key = "<leader>fw";
        action = "<cmd>FzfLua grep_cword<CR>";
        mode = "n";
        options.desc = "Grep word under cursor";
      }
      {
        key = "<leader>ft";
        action = "<cmd>FzfLua treesitter<CR>";
        mode = "n";
        options.desc = "fzf Treesitter";
      }
      # Lsp stuff
      {
        key = "<leader>a";
        action = "<cmd>FzfLua lsp_code_actions<CR>";
        mode = "n";
        options.desc = "Code actions";
      }
      {
        key = "<leader>fr";
        action = "<cmd>FzfLua lsp_references<CR>";
        mode = "n";
        options.desc = "LSP references";
      }
      {
        key = "<leader>fds";
        action = "<cmd>FzfLua lsp_document_symbols<CR>";
        mode = "n";
        options.desc = "LSP document symbols";
      }
      {
        key = "<leader>fws";
        action = "<cmd>FzfLua lsp_workspace_symbols<CR>";
        mode = "n";
        options.desc = "LSP workspace symbols";
      }
      {
        key = "<leader>t";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        mode = "n";
        options.desc = "Toggle diagnostics";
      }
    ];
  };
}
