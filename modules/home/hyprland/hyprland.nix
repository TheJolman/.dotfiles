{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true

    settings = {
      "$mod" = "SUPER";
      "input:kb_options=caps:swapespace"

      "exec-once = hyprpaper & hypridle & waybar & dunst"
      "exec-once = np-applet --indicator & blueman-applet"
      "exec-once = kitty"

      "$terminal = kitty"
      "$fileManager = nautilus"
      "$menu = wofi --show drun --prompt=\"\""
      "$browser = firefox"
      bind =
        [
          "$mod, right,       changegroupactive, f"
          "$mod, left,        changegroupactive, b"
          "$mod SHIFT left,  moveintogroup, l"
          "$mod SHIFT right, moveintogroup, r"
          "$mod SHIFT up,    moveintogroup, u"
          "$mod SHIFT down,  moveintogroup, d"
          # ", Print, exec, grimblast copy area"

          "$mod, B,      exec, $browser"
          "$mod, Return, exec, $terminal"
          "$mod, D,      exec, $menu"
          "$mod, Q,      exec, killactive, left"
          "$mod SHIFT, M, exit"

          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"

        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
    }
  }
}
