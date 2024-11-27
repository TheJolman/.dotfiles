{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/default.nix
    ./maps.nix
  ];
  programs.nixvim = {
    enable = true;
    vimAlias = true;

# might want to move this into a lua file if it gets bigger
    extraConfigLua = ''
      vim.keymap.set('n', '<A-h>', function()
          local current_state = vim.lsp.inlay_hint.is_enabled(0)
          vim.lsp.inlay_hint.enable(0, not current_state)
      end, { desc = "Toggle inlay hints" })

      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "c", "cpp", "javascript", "typescript", "java", "rust", "go" },
        callback = function()
          vim.bo.commentstring = "// %s"
        end,
      })
    '';

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";

      settings = {
        transparent_background = false;

        integrations = {
          cmp = true;
          gitsigns = true;
          indent_blankline = {
            enabled = true;
            colored_indent_levels = true;
          };
          neogit = true;
          nvim_surround = true;
          rainbow_delimiters = true;
          illuminate = true;
          diffview = true;
          fzf = true;
          native_lsp = {
            enabled = true;
            virtual_text = {
              errors = ["italic"];
              hints = ["italic"];
              warnings = ["underline"];
              information = ["underline"];
            };
            inlay_hints = {background = true;};
          };
          mini.enabled = true;
        };
      };
    };

    opts = {
      number = true;
      relativenumber = true;
      expandtab = true; # convert tabs to spaces
      tabstop = 2; # tab width
      shiftwidth = 2; # indent size
      smartindent = true;
      pumheight = 10;
      pumwidth = 10;
      cursorline = true;
      autoindent = true;
      wildmenu = true;
      showmatch = true;
      matchtime = 3;
      autoread = true;
      termguicolors = true;
      colorcolumn = "100"; # this has to be a string for some reason
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
      scrolloff = 8;
      backup = false;
      writebackup = false;
      swapfile = false;
      undofile = true;
      hidden = true;
      completeopt = ["menuone" "noselect"];
      gdefault = true;
      foldmethod = "indent";
      foldlevelstart = 99;
      splitbelow = true;
      splitright = true;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
