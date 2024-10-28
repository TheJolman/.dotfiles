{pkgs, ...}: {
  home.packages = [pkgs.zed-editor];
  home.file.".config/zed/settings.json".text = ''

    {
      "telemetry": {
        "metrics": false
      },
      "vim_mode": true,
      "ui_font_size": 16,
      "buffer_font_size": 16,
      "theme": {
        "mode": "dark",
        "light": "Ayu Light",
        "dark": "Ayu Mirage"
      },
      "show_completions_on_input": true,
    }

  '';
}
