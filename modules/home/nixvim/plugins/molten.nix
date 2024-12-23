{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      molten = {
        enable = true;
        settings = {
          image_provide = "kitty";
        };
      };
    };
    extraPackages = with pkgs; [
      python312Packages.pnglatex
      python312Packages.plotly
      python312Packages.kaleido
      python312Packages.pyperclip
    ];
  };
}
