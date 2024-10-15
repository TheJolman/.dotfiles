{pkgs, ...}: {
  home.packages = [ pkgs.matlab-language-server ];
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          html.enable = true;
          cssls.enable = true;
          nil_ls.enable = true;
          # asm-lsp.enable = true;
          bashls.enable = true;
          cmake.enable = true;
          clangd.enable = true;
          # gleam.enable = true; # works just not using gleam atm
          jsonls.enable = true;
          lua_ls.enable = true;
          pyright.enable = true;
          ts_ls.enable = true;
          jdtls.enable = true;
          csharp_ls.enable = true;
          svelte.enable = true;
        };


        onAttach = ''
          local bufmap = function(keys, func, description)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = description })
          end

          bufmap("<leader>r", vim.lsp.buf.rename, "symbol rename")
          bufmap("<leader>a", vim.lsp.buf.code_action, "code action")

          bufmap("gd", vim.lsp.buf.definition, "go to definition")
          bufmap("gD", vim.lsp.buf.declaration, "go to declaration")
          bufmap("gi", vim.lsp.buf.implementation, "go to implementation")
          bufmap("gtd", vim.lsp.buf.type_definition, "go to type definition")

          bufmap("gr", require("telescope.builtin").lsp_references, "go to references")
          bufmap("gs", require("telescope.builtin").lsp_document_symbols, "document symbols")
          bufmap("gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "workspace symbols")

          bufmap("K", vim.lsp.buf.hover, "hover info")

          vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
            vim.lsp.buf.format()
          end, {})

        '';
      };
    };

    # nixvim doesn't seem to include matlab lsp support
    extraConfigLua = ''
      local lspconfig = require('lspconfig')
      lspconfig.matlab_ls.setup({
        cmd = { "matlab-language-server", "--stdio" },
        filetypes = { "matlab" },
        root_dir = lspconfig.util.find_git_ancestor,
        settings = {
          MATLAB = {
            indexWorkspace = false,
            installPath = "",
            matlabConnectionTiming = "onStart",
            telemetry = true
          }
        },
        single_file_support = true
      })

      -- Set filetype for .m files to MATLAB
      vim.filetype.add({
        extension = {
          m = "matlab",
        },
      })

    '';

  };
}
