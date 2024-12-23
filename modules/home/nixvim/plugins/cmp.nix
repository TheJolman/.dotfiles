{...}: {
  programs.nixvim.plugins.cmp = {
    enable = true;

    autoEnableSources = true;
    settings = {
      window = {
        completion.border = "rounded";
        documentation = {
          border = "rounded";
          # max_height
          # max_width
        };
      };
      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-e>" = "cmp.mapping.close()";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-k>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };
      snippet = {
        expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      };

      sources = [
        {name = "nvim_lsp";}
        {name = "luasnip";}
        {name = "path";}
        {name = "buffer";}
      ];
    };
  };
}
