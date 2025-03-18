{pkgs, ...}: {
  programs.vscode = {
    enable = false;
    package = pkgs.vscode.fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      denoland.vscode-deno
      ziglang.vscode-zig
      vscjava.vscode-java-pack
      vscjava.vscode-gradle
      ms-vscode.cpptools
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
  };
}
