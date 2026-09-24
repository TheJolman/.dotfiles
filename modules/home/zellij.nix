{...}: {
  programs.zellij = {
    enable = true;
    extraConfig = ''
        keybinds clear-defaults=true {
            normal {
                bind "Ctrl g" { SwitchToMode "Tmux"; }
            }

            tmux {
                // Leave Zellij mode
                bind "Esc" "Ctrl g" { SwitchToMode "Normal"; }

                // Move between panes
                bind "h" { MoveFocus "Left";  SwitchToMode "Normal"; }
                bind "j" { MoveFocus "Down";  SwitchToMode "Normal"; }
                bind "k" { MoveFocus "Up";    SwitchToMode "Normal"; }
                bind "l" { MoveFocus "Right"; SwitchToMode "Normal"; }

                // Resize panes
                bind "H" { Resize "Increase Left";  SwitchToMode "Normal"; }
                bind "J" { Resize "Increase Down";  SwitchToMode "Normal"; }
                bind "K" { Resize "Increase Up";    SwitchToMode "Normal"; }
                bind "L" { Resize "Increase Right"; SwitchToMode "Normal"; }

                // Create panes
                bind "n" { NewPane; SwitchToMode "Normal"; }
                bind "v" { NewPane "Right"; SwitchToMode "Normal"; }
                bind "s" { NewPane "Down"; SwitchToMode "Normal"; }

                // Pane operations
                bind "x" { CloseFocus; SwitchToMode "Normal"; }
                bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }

                // Tabs
                bind "t" { NewTab; SwitchToMode "Normal"; }
                bind "w" { CloseTab; SwitchToMode "Normal"; }
                bind "[" { GoToPreviousTab; SwitchToMode "Normal"; }
                bind "]" { GoToNextTab; SwitchToMode "Normal"; }

                bind "1" { GoToTab 1; SwitchToMode "Normal"; }
                bind "2" { GoToTab 2; SwitchToMode "Normal"; }
                bind "3" { GoToTab 3; SwitchToMode "Normal"; }
                bind "4" { GoToTab 4; SwitchToMode "Normal"; }
                bind "5" { GoToTab 5; SwitchToMode "Normal"; }
                bind "6" { GoToTab 6; SwitchToMode "Normal"; }
                bind "7" { GoToTab 7; SwitchToMode "Normal"; }
                bind "8" { GoToTab 8; SwitchToMode "Normal"; }
                bind "9" { GoToTab 9; SwitchToMode "Normal"; }

                // Session
                bind "d" { Detach; }
                bind "q" { Quit; }
            }
        }

      show_startup_tips false
      pane_frames false
      theme "moonfly"

      // moonfly theme for Zellij
      //
      // Upstream: github.com/bluz71/vim-moonfly-colors

      themes {
          moonfly {
              text_unselected {
                  base 189 189 189
                  background 8 8 8
                  emphasis_0 247 140 108
                  emphasis_1 121 218 200
                  emphasis_2 140 200 95
                  emphasis_3 207 135 232
              }
              text_selected {
                  base 189 189 189
                  background 64 64 64
                  emphasis_0 247 140 108
                  emphasis_1 121 218 200
                  emphasis_2 140 200 95
                  emphasis_3 207 135 232
              }
              ribbon_selected {
                  base 8 8 8
                  background 140 200 95
                  emphasis_0 216 51 75
                  emphasis_1 132 105 100
                  emphasis_2 171 101 217
                  emphasis_3 89 138 255
              }
              ribbon_unselected {
                  base 8 8 8
                  background 198 198 198
                  emphasis_0 216 51 75
                  emphasis_1 108 108 108
                  emphasis_2 89 138 255
                  emphasis_3 171 101 217
              }
              table_title {
                  base 140 200 95
                  background 0
                  emphasis_0 247 140 108
                  emphasis_1 121 218 200
                  emphasis_2 140 200 95
                  emphasis_3 207 135 232
              }
              table_cell_selected {
                  base 189 189 189
                  background 64 64 64
                  emphasis_0 247 140 108
                  emphasis_1 121 218 200
                  emphasis_2 140 200 95
                  emphasis_3 207 135 232
              }
              table_cell_unselected {
                  base 189 189 189
                  background 8 8 8
                  emphasis_0 247 140 108
                  emphasis_1 121 218 200
                  emphasis_2 140 200 95
                  emphasis_3 207 135 232
              }
              list_selected {
                  base 189 189 189
                  background 64 64 64
                  emphasis_0 247 140 108
                  emphasis_1 121 218 200
                  emphasis_2 140 200 95
                  emphasis_3 207 135 232
              }
              list_unselected {
                  base 189 189 189
                  background 8 8 8
                  emphasis_0 247 140 108
                  emphasis_1 121 218 200
                  emphasis_2 140 200 95
                  emphasis_3 207 135 232
              }
              frame_selected {
                  base 140 200 95
                  background 0
                  emphasis_0 247 140 108
                  emphasis_1 121 218 200
                  emphasis_2 207 135 232
                  emphasis_3 0
              }
              frame_highlight {
                  base 247 140 108
                  background 0
                  emphasis_0 207 135 232
                  emphasis_1 247 140 108
                  emphasis_2 247 140 108
                  emphasis_3 247 140 108
              }
              exit_code_success {
                  base 140 200 95
                  background 0
                  emphasis_0 121 218 200
                  emphasis_1 8 8 8
                  emphasis_2 207 135 232
                  emphasis_3 128 160 255
              }
              exit_code_error {
                  base 230 94 114
                  background 0
                  emphasis_0 227 199 138
                  emphasis_1 0
                  emphasis_2 0
                  emphasis_3 0
              }
              multiplayer_user_colors {
                  player_1 207 135 232
                  player_2 128 160 255
                  player_3 0
                  player_4 227 199 138
                  player_5 121 218 200
                  player_6 0
                  player_7 230 94 114
                  player_8 0
                  player_9 0
                  player_10 0
              }
          }
      }

    '';
  };
}
