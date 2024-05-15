{ config, pkgs, ... }:

{
  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    catppuccin.enable = true;
    

    extraLuaConfig = ''

    ${builtins.readFile ./nvim/options.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      {
        plugin = comment-nvim;
        #config = toLua "require(\"Comment\").setup()";
      }
      # {
      #   plugin = gruvbox-nvim;
      #   config = "colorscheme gruvbox";
      # }

      {
        plugin = oil-nvim;
        # config = "require(\"oil\").setup()";
      }

      {
        plugin = nvim-autopairs;
        #config = toLua "require(\"nvim-autopairs\").setup()";
      }

      {
        plugin = nvim-surround;
        #config = "require(\"nvim-surround\").setup()";
      }
      
      {
        plugin = lualine-nvim;
        config = toLuaFile ./nvim/plugin/lualine.lua;
      }

      #nvim-cmp
      #telescope-nvim
      #telescope-fzf-native-nvim

      #luasnip
      #friendly-snippets

      nvim-web-devicons

      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-json
        p.tree-sitter-python
        p.tree-sitter-cpp
      ]))

      vim-nix

    ];

  };


}
