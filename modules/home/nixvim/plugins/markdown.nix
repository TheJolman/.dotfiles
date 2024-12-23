{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      render-markdown = {
        enable = true;
      };
      markdown-preview = {
        enable = true;
      };
    };
    extraPackages = with pkgs; [python312Packages.pylatexenc];
  };
}
