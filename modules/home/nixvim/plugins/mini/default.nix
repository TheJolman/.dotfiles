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
        ai = {};
        diff = {};
        statusline = {};
        tabline = {};
        bracketed = {};
        clue = {};

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
               ▄   ▄█     ▄     ▄   ▄█ █▀▄▀█
                █  ██ ▀▄   █     █  ██ █ █ █
            ██   █ ██   █ ▀ █     █ ██ █ ▄ █
            █ █  █ ▐█  ▄ █   █    █ ▐█ █   █
            █  █ █  ▐ █   ▀▄  █  █   ▐    █
            █   ██     ▀       █▐        ▀
                               ▐
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
      luaConfig.content = builtins.readFile ./config.lua;
    };
  };
}
