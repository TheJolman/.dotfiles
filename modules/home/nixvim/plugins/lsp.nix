{pkgs, ...}:
{
  # home.packages = with pkgs; [
  #   matlab-language-server
  # ];

  programs.nixvim = {
    extraPackages = with pkgs; [
      matlab-language-server
      alejandra
      dotnet-sdk
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
            settings = {
              formatting.command = ["alejandra"];
            };
          };
          clangd = {
            enable = true;
            package = pkgs.clang-tools;
          };
          mesonlsp.enable = true;
          cmake.enable = true;
          jsonls.enable = true;
          bashls.enable = true;
          lua_ls.enable = true;
          pylsp = {
            enable = true;
            settings.plugins.ruff.enabled = true;
            settings.plugins.mypy.enabled = true;
          };
          jdtls.enable = true;
          csharp_ls.enable = true;
          # --- Web ---
          intelephense = {
            enable = true;
            package = pkgs.intelephense;
          };
          html.enable = true;
          cssls.enable = true;
          # ts_ls.enable = true;
          denols.enable = true;
          svelte.enable = true;
        };

        onAttach = ''
          local bufmap = function(keys, func, description)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = description })
          end

          bufmap("<leader>r", vim.lsp.buf.rename, "symbol rename")
          --bufmap("<leader>a", vim.lsp.buf.code_action, "code action")
          bufmap("<leader>a", "<cmd>FzfLua lsp_code_actions<CR>", "code action")

          bufmap("gd", vim.lsp.buf.definition, "go to definition")
          bufmap("gD", vim.lsp.buf.declaration, "go to declaration")
          bufmap("gi", vim.lsp.buf.implementation, "go to implementation")
          bufmap("gtd", vim.lsp.buf.type_definition, "go to type definition")

          bufmap("gr", "<cmd>FzfLua lsp_references<CR>", "go to references")
          bufmap("gs", "<cmd>FzfLua lsp_document_symbols<CR>", "document symbols")
          bufmap("gS", "<cmd>FzfLua lsp_workspace_symbols<CR>", "workspace symbols")

          bufmap("K", vim.lsp.buf.hover, "hover info")

          vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
            vim.lsp.buf.format()
          end, {})

        '';
      };
    };

    extraConfigLua = builtins.readFile ./lua/lsp-config.lua;
  };
}
