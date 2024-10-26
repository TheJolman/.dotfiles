{pkgs, ...}: {
  home.packages = with pkgs; [ 
    matlab-language-server
  ];


  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          html.enable = true;
          cssls.enable = true;
          nixd = {
            enable = true;
            settings = {
              formatting.command = ["alejandra"];
            };
          };
          bashls.enable = true;
          cmake.enable = true;
          clangd.enable = true;
          jsonls.enable = true;
          lua_ls.enable = true;
          pylsp = {
            enable = true;
            settings.plugins.ruff.enabled = true;
          };
          ts_ls.enable = true;
          jdtls.enable = true;
          omnisharp.enable = true;
          svelte.enable = true;
          mesonlsp.enable = true;
        };


        onAttach = ''
          local bufmap = function(keys, func, description)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = description })
          end

          bufmap("<leader>r", vim.lsp.buf.rename, "symbol rename")
          --bufmap("<leader>a", vim.lsp.buf.code_action, "code action")
          bufmap("<leader>a", FzfLua lsp_code_actions, "code action")

          bufmap("gd", vim.lsp.buf.definition, "go to definition")
          bufmap("gD", vim.lsp.buf.declaration, "go to declaration")
          bufmap("gi", vim.lsp.buf.implementation, "go to implementation")
          bufmap("gtd", vim.lsp.buf.type_definition, "go to type definition")

          bufmap("gr", FzfLua lsp_references, "go to references")
          bufmap("gs", FzfLua lsp_document_symbols, "document symbols")
          bufmap("gS", FzfLua lsp_workspace_symbols, "workspace symbols")

          bufmap("K", vim.lsp.buf.hover, "hover info")

          vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
            vim.lsp.buf.format()
          end, {})

        '';
      };
    };

    extraConfigLua= builtins.readFile ./lua/lsp-config.lua;
  };
}
