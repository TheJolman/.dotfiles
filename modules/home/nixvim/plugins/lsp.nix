{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      matlab-language-server
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
          pylsp = {
            enable = true;
            pythonPackage = pkgs.python313;
            package = pkgs.python313Packages.python-lsp-server;
            settings = {
              plugins = {
                black = {
                  enabled = true;
                  line_length = 100;
                };
                isort = {
                  enabled = true;
                  profile = "black";
                };
                ruff.enabled = true;
                pylsp_mypy.enabled = true;
                rope.enabled = true;
              };
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

          # JavasScript/TypeScript
          denols.enable = false;
          ts_ls.enable = true;

          # Other web dev
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
          html = {
            enable = true;
            settings = {
              html = {
                format = {
                  enable = true;
                  wrapLineLength = 100;
                  wrapAttributes = "auto";
                  templating = true;
                  unformatted = null;
                };
              };
            };
          };
          htmx.enable = true;
          cssls.enable = true;
          tailwindcss = {
            enable = true;
          };
          jsonls.enable = true;

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
