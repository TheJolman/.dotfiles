{ ... }: {
  imports = [
    ./toggleterm.nix
    ./autopairs.nix
    ./lualine.nix
    ./lsp.nix
    ./telescope.nix
    ./cmp.nix
    ./treesitter.nix
    ./oil.nix
    ./surround.nix
    ./luasnip.nix # this needs to actually be configured, something something jsregexp
    ./flash.nix
    ./indent-blankline.nix
    # conform
  ];
}
