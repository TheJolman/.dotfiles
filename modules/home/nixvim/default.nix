{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/default.nix 
    ./maps.nix
    ];
  programs.nixvim = {
    enable = true;
    vimAlias = true;

    extraConfigLua = ''
      vim.lsp.inlay_hint.enable()

    '';

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "frappe";

      settings = {
        transparent_background = true;

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
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;

      pumheight = 10;
      pumwidth = 10;
      cursorline = true;
      autoindent = true;
      wildmenu = true;
      showmatch = true;
      autoread = true;
      termguicolors = true;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
