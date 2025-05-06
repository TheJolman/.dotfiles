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
        keymaps = {
          lspBuf = {
            K = "hover";
            "<leader>fm" = "format";
          };
          extra = [
            {
              key = "gD";
              action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
              mode = "n";
              options.desc = "LSP references";
            }
            {
              key = "gd";
              action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
              mode = "n";
              options.desc = "LSP definitions";
            }
            {
              key = "gt";
              action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
              mode = "n";
              options.desc = "LSP type definitions";
            }
            {
              key = "<leader>i";
              action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
              mode = "n";
              options.desc = "Toggle inlay hints";
            }
            {
              key = "<leader>fsd";
              action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
              mode = "n";
              options.desc = "LSP document symbols";
            }
            {
              key = "<leader>fsw";
              action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
              mode = "n";
              options.desc = "LSP workspace symbols";
            }
            {
              key = "<A-d>";
              action = "<cmd>Trouble diagnostics toggle<cr>";
              mode = "n";
              options.desc = "Toggle diagnostics";
            }
          ];
        };

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
            /*
            this is allegedly more robust - it searches the entire strucure before looking for
            the next. Otherwise it will search for each before moving to the next dir.
            */
            rootDir = ''
              function(fname)
                local util = require("lspconfig.util")
                return util.root_pattern("*.sln")(fname) or
                       util.root_pattern("*.csproj")(fname) or
                       util.root_pattern("*.git")(fname) or
            '';
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
      };
    };
  };
}
