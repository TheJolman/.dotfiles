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
          clangd = {
            enable = true;
            package = pkgs.clang-tools;
          };
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
                format = {
                  enable = true;
                  defaultConfig = {
                    indent_style = "space";
                    indent_size = "2";
                  };
                };
                runtime = {
                  version = "LuaJIT";
                };
                workspace = {
                  checkThirdParty = false;
                };
              };
            };
          };

          # Python
          pylsp = {
            enable = true;
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
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                "poetry.lock",
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
            rootDir = ''
              require('lspconfig.util').root_pattern(
                -- Maven
                "pom.xml",
                -- Gradle
                "settings.gradle",
                "settings.gradle.kts",
                -- Eclipse
                ".project",
                ".git"
              )
            '';
          };

          # C#
          csharp_ls = {
            enable = true;
            package = pkgs.csharp-ls;
            rootDir = ''
              require('lspconfig.util').root_pattern(
                "*.sln",
                "*.csproj",
                ".git"
              )
            '';
          };

          # Rust
          rust_analyzer = {
            enable = true;
            rootDir = ''
              require('lspconfig.util').root_pattern(
                "Cargo.toml",
                "rust-project.json",
                ".git"
              )
            '';
            installRustc = true;
            installCargo = true;
          };

          # Go
          gopls = {
            enable = true;
            rootDir = ''
              require('lspconfig.util').root_pattern(
                "go.mod",
                "go.work",
                ".git"
              )
            '';
          };

          # PHP
          intelephense = {
            enable = true;
            package = pkgs.intelephense;
          };

          # JavasScript/TypeScript
          denols = {
            enable = false;
            rootDir = ''
              require('lspconfig.util').root_pattern(
                "deno.json",
                "deno.jsonc",
                "package.json",
                "tsconfig.json",
                ".git"
              )
            '';
          };

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
            rootDir = ''
              require('lspconfig.util').root_pattern(
                "tailwind.config.js",
                "tailwind.config.cjs",
                "tailwind.config.mjs",
                "tailwind.config.ts",
                ".git"
              )
            '';
            filetypes = [
              "htmldjango"
              "html"
              "markdown"
              "css"
              "javascript"
              "typescript"
              "svelte"
              "javascriptreact"
            ];
          };
          jsonls.enable = true;

          # Misc
          dockerls.enable = true;
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

          bufmap("glr", "<cmd>FzfLua lsp_references<CR>", "go to references")
          bufmap("gls", "<cmd>FzfLua lsp_document_symbols<CR>", "document symbols")
          bufmap("glS", "<cmd>FzfLua lsp_workspace_symbols<CR>", "workspace symbols")

          bufmap("K", vim.lsp.buf.hover, "hover info")

          vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
            vim.lsp.buf.format()
          end, {})

          bufmap("<leader>fm", "<cmd>Format<CR>", "format buffer")
        '';
      };
    };

    extraConfigLua = builtins.readFile ./lua/lsp-config.lua;
  };
}
