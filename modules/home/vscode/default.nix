{pkgs, ...}: {
  home.packages = with pkgs; [
    dotnetCorePackages.dotnet_8.sdk
  ];
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        denoland.vscode-deno
        ziglang.vscode-zig
        vscjava.vscode-java-pack
        vscjava.vscode-gradle
        ms-vscode.cpptools
        # llvm-vs-code-extensions.vscode-clangd
        ms-vscode.makefile-tools
        ms-vscode.cmake-tools
        mesonbuild.mesonbuild
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
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
        mkhl.direnv
        golang.go
        rust-lang.rust-analyzer
      ];
      enableExtensionUpdateCheck = false;
      userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    };
  };
}
