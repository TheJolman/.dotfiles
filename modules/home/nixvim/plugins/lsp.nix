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

    plugins.lsp = {
      enable = true;

      luaConfig.post = ''
        -- vim.diagnostic.config({ virtual_text = true })

        vim.api.nvim_create_autocmd(
          {"BufEnter", "CursorHold", "InsertLeave"},
          {
            buffer = 0,
            desc = "Refresh codelens on buffer events",
            callback = function()
              vim.lsp.codelens.refresh({ bufnr = 0 })
            end,
          }
        )
      '';
      luaConfig.pre = ''
        show_codelens = function()
          local current_bufnr = vim.api.nvim_get_current_buf()
          local clients = vim.lsp.get_clients({ bufnr = current_bufnr })
          if #clients > 0 then
            local client_id = clients[1].id
            local all_lenses = vim.lsp.codelens.get({ bufnr = current_bufnr })
            if all_lenses and #all_lenses > 0 then
              vim.lsp.codelens.display(all_lenses, current_bufnr, client_id)
              print("Displayed " .. #all_lenses .. " lenses for client " .. client_id)
            else
              print("No codelens found for buffer " .. current_bufnr)
            end
          else
            print("No active LSP client found for buffer " .. current_bufnr)
          end
        end
      '';

      keymaps = {
        lspBuf = {
          K = "hover";
          "<leader>fm" = "format";
        };
        extra = [
          {
            key = "grl";
            action = "<cmd>lua show_codelens()<CR>";
            mode = "n";
            options.desc = "Show codelens";
          }
          {
            key = "grr";
            action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
            mode = "n";
            options.desc = "LSP references";
          }
          {
            key = "gd";
            action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
            mode = "n";
            options.desc = "LSP definition";
          }
          {
            key = "gD";
            action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>";
            mode = "n";
            options.desc = "LSP declaration";
          }
          {
            key = "gt";
            action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
            mode = "n";
            options.desc = "LSP type definition";
          }
          {
            key = "gi";
            action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
            mode = "n";
            options.desc = "Toggle inlay hints";
          }
          {
            key = "gO";
            action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
            mode = "n";
            options.desc = "LSP document symbols";
          }
          {
            key = "grs";
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
              workspace. checkThirdParty = false;
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
          rootMarkers = ["pyproject.toml" "pixi.toml" "requirements.txt" ".git"];
        };

        pylsp = {
          enable = true;
          pythonPackage = pkgs.python313;
          package = pkgs.python313Packages.python-lsp-server;
          rootMarkers = ["pyproject.toml" "pixi.toml" "requirements.txt" ".git"];
        };

        # Java
        jdtls = {
          enable = true;
          settings.java.format.enabled = true;
        };

        # C#
        csharp_ls = {
          enable = true;
          package = pkgs.csharp-ls;
          rootMarkers = ["*.sln" "*.csproj" "*.git"];
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
        denols = {
          enable = true;
          rootMarkers = ["deno.json" "deno.jsonc"];
        };

        ts_ls = {
          enable = true;
          rootMarkers = ["package.json"];
        };

        eslint = {
          enable = true;
          cmd = ["vscode-eslint-language-server --stdio"];
          rootMarkers = ["package.json" "deno.json" "deno.jsonc"];
        };

        jinja_lsp = {
          enable = true;
          package = null;
          settings.jinja.formatter = "djlint";
        };

        svelte = {
          enable = true;
          settings.svelte.format.enable = true;
        };

        # html.enable = true;
        superhtml.enable = true;
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
}
