{...}: {
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        icons = {};
        files = {
          mappings = {
            go_in_plus = "<CR>";
          };
          windows = {
            preview = true;
          };
        };
        clue = {};
        sessions = {
          autowrite = true;
        };
        trailspace = {};
        cursorword = {};
        git = {};
        bufremove = {};
        ai = {};
        diff = {};
        statusline = {};
        tabline = {};
        bracketed = {};
        clue = {
          triggers = [
            # Leader triggers
            {
              mode = "n";
              keys = "<Leader>";
            }
            {
              mode = "v";
              keys = "<Leader>";
            }
            # g key
            {
              mode = "n";
              keys = "g";
            }
            {
              mode = "v";
              keys = "g";
            }
            {
              mode = "n";
              keys = "<C>";
            }
            {
              mode = "n";
              keys = "<A>";
            }
          ];
        };

        surround = {
          mappings = {
            add = "gsa";
            delete = "gsd";
            find = "gsf";
            find_left = "gsF";
            highlight = "gsh";
            replace = "gsr";
            update_n_lines = "gsn";
          };
        };

        notify = {
          lsp_progress = {
            enable = false;
            duration_last = 1000;
          };
        };

        starter = {
          content_hooks = {
            "__unkeyed-1.adding_bullet" = {
              __raw = "require('mini.starter').gen_hook.adding_bullet()";
            };
            "__unkeyed-2.indexing" = {
              __raw = "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' })";
            };
            "__unkeyed-3.padding" = {
              __raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
            };
          };
          evaluate_single = true;
          header = ''
                 ___                       ___                                    ___
                /__/\        ___          /__/|          ___        ___          /__/\
                \  \:\      /  /\        |  |:|         /__/\      /  /\        |  |::\
                 \  \:\    /  /:/        |  |:|         \  \:\    /  /:/        |  |:|:\
             _____\__\:\  /__/::\      __|__|:|          \  \:\  /__/::\      __|__|:|\:\
            /__/::::::::\ \__\/\:\__  /__/::::\____  ___  \__\:\ \__\/\:\__  /__/::::| \:\
            \  \:\~~\~~\/    \  \:\/\    ~\~~\::::/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
             \  \:\  ~~~      \__\::/     |~~|:|~~  \  \:\|  |:|     \__\::/  \  \:\
              \  \:\          /__/:/      |  |:|     \  \:\__|:|     /__/:/    \  \:\
               \  \:\         \__\/       |  |:|      \__\::::/      \__\/      \  \:\
                \__\/                     |__|/           ~~~~                   \__\/

          '';
          items = {
            "__unkeyed-1.buildtin_actions" = {
              __raw = "require('mini.starter').sections.builtin_actions()";
            };
            "__unkeyed-2.recent_files_current_directory" = {
              __raw = "require('mini.starter').sections.recent_files(5, false)";
            };
            "__unkeyed-3.recent_files" = {
              __raw = "require('mini.starter').sections.recent_files(5, true)";
            };
            "__unkeyed-4.sessions" = {
              __raw = "require('mini.starter').sections.sessions(5, true)";
            };
          };
        };
      }; # modules
      luaConfig.post = ''
        local sessions = require("mini.sessions")

        local function save_session(name)
          name = name or vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          sessions.write(name)
          vim.notify("Session '" .. name .. "' written, vim.log.levels.INFO")
        end

        vim.api.nvim_create_user_command("SSave", function(opts)
          save_session(opts.args ~= "" and opts.args or nil)
        end, { nargs = "?", complete = "file"})

        vim.api.nvim_create_user_command("SPick", function()
          sessions.select()
        end, {})
      '';
    };
  };
}
