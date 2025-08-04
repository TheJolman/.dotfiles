{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins/default.nix
    ./maps.nix
  ];
  programs.nixvim = {
    enable = true;
    vimAlias = true;
    nixpkgs.config.allowUnfree = true;

    extraConfigLua = builtins.readFile ./extra.lua;

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";

      settings = {
        transparent_background = false;
        show_end_of_buffer = true;
        dim_inactive.enabled = true;

        integrations = {
          cmp = true;
          gitsigns = true;
          indent_blankline = {
            enabled = true;
            colored_indent_levels = true;
          };
          flash = true;
          rainbow_delimiters = true;
          diffview = true;
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
          snacks = {
            enabled = true;
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
      concealcursor = "";
      listchars.tab = "→ ";
      list = true;
      showbreak = "↪ ";
      laststatus = 3; # avante wants this
      breakindent = true;
      wrap = false;
      sidescroll = 5;
      listchars.precedes = "<";
      listchars.extends = ">";
      confirm = true;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
