{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/default.nix
    ./maps.nix
  ];
  programs.nixvim = {
    enable = true;
    vimAlias = true;

    extraConfigLua = builtins.readFile ./autocmds.lua;

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
      autoindent = true;
      smartindent = true;
      pumheight = 10;
      pumwidth = 10;
      cursorline = true;
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
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
      foldlevelstart = 99;
      splitbelow = true;
      splitright = true;
      conceallevel = 3;
      listchars.tab = "→ ";
      list = true;
      showbreak = "↪ ";
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
