{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
      };
      display = {
        key.width = 14;
        percent.type = 2;
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "bios"
        "kernel"

        "separator"
        "shell"
        "lm"
        "de"
        "wm"
        "terminal"
        "editor"

        "separator"
        {
          type = "cpu";
          "showPeCoreCount" = true;
        }
        "memory"
        "disk"
        "vulkan"
        "opengl"
      ];
    };
  };
}
