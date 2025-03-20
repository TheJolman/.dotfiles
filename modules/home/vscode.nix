{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      denoland.vscode-deno
      ziglang.vscode-zig
      vscjava.vscode-java-pack
      vscjava.vscode-gradle
      ms-vscode.cpptools
      llvm-vs-code-extensions.vscode-clangd
      ms-vscode.makefile-tools
      ms-vscode.cmake-tools
      mesonbuild.mesonbuild
      ms-vscode-remote.vscode-remote-extensionpack
      ms-azuretools.vscode-docker
      ms-dotnettools.vscode-dotnet-runtime
      ms-dotnettools.csharp
      ms-dotnettools.csdevkit
      sumneko.lua
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      ms-python.python
      ms-toolsai.jupyter
      zainchen.json
      bbenoist.nix
      golang.go
      rust-lang.rust-analyzer
    ];
    enableExtensionUpdateCheck = false;
    userSettings = builtins.fromJSON ''
      {
          "editor.semanticHighlighting.enabled": true,
          "terminal.integrated.minimumContrastRatio": 1,
          "window.titleBarStyle": "custom",
          "workbench.colorTheme": "Catppuccin Mocha",
          "catppuccin.accentColor": "pink",
          "catppuccin.customUIColors": {
            "mocha": {
              "statusBar.foreground": "accent"
            }
          },

          "files.autoSave": "off",
          "editor.minimap.enabled": false,
          "editor.fontFamily": "'CaskaydiaCove Nerd Font', monospace",
          "editor.fontSize": 14,
          "editor.fontLigatures": true,
          "terminal.integrated.fontFamily": "'CaskaydiaCove Nerd Font', monospace",
          "terminal.integrated.fontLigatures.enabled": true,
          "editor.renderWhitespace": "trailing",
          "editor.lightbulb.enabled": "off",
          "window.menuBarVisibility": "toggle",
          "window.titleBarStyle": "native",
          "workbench.activityBar.location": "default",
          "editor.scrollbar.vertical": "hidden",
          "editor.scrollbar.horizontal": "hidden",
          "editor.wordWrap": "on",
          "editor.tabSize": 2,
          "editor.lineHeight": 1.3,
          "editor.insertSpaces": true,
          "editor.formatOnSave": true,
          "editor.foldingStrategy": "indentation",
          "editor.showFoldingControls": "mouseover",
          "telemetry.telemetryLevel": "off",
          "workbench.enableExperiments": false,
          "extensions.autoUpdate": false,
          "extensions.ignoreRecommendations": true,

          "update.mode": "none",
          "vim.leader": "<space>",
          "vim.overrideCopy": true,
          "vim.useSystemClipboard": true,
          "vim.normalModeKeyBindings": [
              {
                  "before": [
                      "<leader>",
                      "w"
                  ],
                  "commands": [
                      "workbench.action.files.save"
                  ]
              },
              {
                  "before": ["C-b"],
                  "commands": [
                      "workbench.action.toggleSidebarVisibility"
                  ]
              },
              {
                  "before": ["<leader>", "g", "g"],
                  "commands": [
                      "workbench.view.scm"
                  ]
              },
              {
                  "before": ["<leader>", "f", "b"],
                  "commands": [
                      "workbench.view.search"
                  ]
              },
              {
                  "before": ["-"],
                  "commands": [
                      "workbench.view.explorer"
                  ]
              },
              {
                  "before": ["g", "d"],
                  "commands": [
                      "editor.action.revealDefinition"
                  ]
              },
              {
                  "before": [
                      "K"
                  ],
                  "commands": [
                      "editor.action.showHover"
                  ]
              }
          ],
          "vim.visualModeKeyBindings": [
              {
                  "before": [
                      ">"
                  ],
                  "commands": [
                      "editor.action.indentLines"
                  ]
              },
              {
                  "before": [
                      "<"
                  ],
                  "commands": [
                      "editor.action.outdentLines"
                  ]
              }
          ]
      }

    '';
  };
}
