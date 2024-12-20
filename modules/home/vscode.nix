{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      denoland.vscode-deno
      ziglang.vscode-zig
      vscjava.vscode-java-pack
      llvm-vs-code-extensions.vscode-clangd
      ms-vscode.makefile-tools
      ms-vscode.cmake-tools
      ms-vscode-remote.remote-containers
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
      mesonbuild.mesonbuild
      golang.go
      rust-lang.rust-analyzer
    ];
  };
}
