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
      vim.lsp.inlay_hint.enable()

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
          treesitter = true;
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
