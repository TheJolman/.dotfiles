{...}: {
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        icons = {};
        files = {};
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
        pairs = {};
        clue = {
          triggers = [
            # Leader triggers
            {
              mode = "n";
              keys = "<Leader>";
            }
            {
              mode = "x";
              keys = "<Leader>";
            }
            # Built-in completion
            {
              mode = "i";
              keys = "<C-x>";
            }
            # g key
            {
              mode = "n";
              keys = "g";
            }
            {
              mode = "x";
              keys = "g";
            }
            # Marks
            {
              mode = "n";
              keys = "'";
            }
            {
              mode = "n";
              keys = "`";
            }
            {
              mode = "x";
              keys = "'";
            }
            {
              mode = "x";
              keys = "`";
            }
            # Registers
            {
              mode = "n";
              keys = "\"";
            }
            {
              mode = "x";
              keys = "\"";
            }
            {
              mode = "i";
              keys = "<C-r>";
            }
            {
              mode = "c";
              keys = "<C-r>";
            }
            # Window commands
            {
              mode = "n";
              keys = "<C-w>";
            }
            # z key
            {
              mode = "n";
              keys = "z";
            }
            {
              mode = "x";
              keys = "z";
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
              __raw = "require('mini.starter').sections.recent_files(10, false)";
            };
            "__unkeyed-3.recent_files" = {
              __raw = "require('mini.starter').sections.recent_files(10, true)";
            };
            "__unkeyed-4.sessions" = {
              __raw = "require('mini.starter').sections.sessions(5, true)";
            };
          };
        };
      }; # modules
    };
  };
}
