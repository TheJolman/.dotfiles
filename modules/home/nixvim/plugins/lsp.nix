{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      alejandra
      dotnetCorePackages.dotnet_8.sdk
      black
      isort
      rustfmt
      shfmt
      stylua
      djlint
      prettierd
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          # Nix
          nixd = {
            enable = true;
            settings = {
              formatting.command = ["alejandra"];
            };
          };

          # C/C++
          clangd.enable = true;
          mesonlsp.enable = true;
          cmake.enable = true;

          # Shell
          bashls.enable = true;
          zk.enable = true;

          # Lua
          lua_ls = {
            enable = true;
            settings = {
              Lua = {
                format.enable = true;
                runtime.version = "LuaJIT";
                workspace = {
                  checkThirdParty = false;
                };
              };
            };
          };

          # Python
          ruff = {
            enable = true;
            settings = {
              line-length = 100;
              indent-width = 4;
            };
            rootDir = ''
              require('lspconfig.util').root_pattern(
                "pyproject.toml",
                "pixi.toml",
                "requirements.txt",
                ".git"
              )
            '';
          };

          pylsp = {
            enable = true;
            pythonPackage = pkgs.python313;
            package = pkgs.python313Packages.python-lsp-server;
            rootDir = ''
              require('lspconfig.util').root_pattern(
                "pyproject.toml",
                "pixi.toml",
                "requirements.txt",
                ".git"
              )
            '';
          };

          # Java
          jdtls = {
            enable = true;
            settings = {
              java = {
                format = {
                  enabled = true;
                };
              };
            };
          };

          # C#
          csharp_ls = {
            enable = true;
            package = pkgs.csharp-ls;
          };

          # Rust
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };

          # Go
          gopls.enable = true;

          # PHP
          intelephense = {
            enable = true;
            package = pkgs.intelephense;
          };

          # Web dev
          denols.enable = true;
          # ts_ls.enable = true;
          eslint.enable = true;

          jinja_lsp = {
            enable = true;
            package = null;
            settings = {
              jinja = {
                formatter = "djlint";
              };
            };
          };

          svelte = {
            enable = true;
            settings.svelte.format.enable = true;
          };

          html.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;

          # Misc
          dockerls.enable = true;
          terraformls.enable = true;
        };

        onAttach = ''
          local bufmap = function(keys, func, description)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = description })
          end

          bufmap("<leader>r", vim.lsp.buf.rename, "symbol rename")
          -- below replaced with FzfLua command
          -- bufmap("<leader>a", vim.lsp.buf.code_action, "code action")

          bufmap("gd", vim.lsp.buf.definition, "go to definition")
          bufmap("gD", vim.lsp.buf.declaration, "go to declaration")
          bufmap("gi", vim.lsp.buf.implementation, "go to implementation")
          bufmap("gtd", vim.lsp.buf.type_definition, "go to type definition")

          bufmap("K", vim.lsp.buf.hover, "hover info")

          vim.api.nvim_buf_create_user_command(bufnr, "Fmt", function(_)
            vim.lsp.buf.format()
          end, {})

          bufmap("<leader>fm", "<cmd>Fmt<CR>", "format buffer")
        '';
      };
    };

    extraConfigLua = builtins.readFile ./lua/lsp-config.lua;
  };
}
