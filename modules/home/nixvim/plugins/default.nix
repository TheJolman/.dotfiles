{...}: {
  imports = [
    ./web-devicons.nix
    ./vimtex.nix
    ./indent-o-matic.nix
    ./toggleterm.nix
    ./autopairs.nix
    ./lualine.nix
    ./lsp.nix
    # ./telescope.nix
    ./cmp.nix
    ./treesitter.nix
    ./fzf.nix
    ./oil.nix
    ./surround.nix
    ./luasnip.nix # this needs to actually be configured, something something jsregexp
    ./flash.nix
    ./indent-blankline.nix
    ./lspsaga.nix
    ./ts-autotag.nix
    ./css-color.nix
    ./which-key.nix
    ./yazi-nvim.nix
    ./molten.nix
    ./markdown.nix
    ./lint.nix
  ];
}
