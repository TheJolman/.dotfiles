{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      render-markdown = {
        enable = false;
      };
      markdown-preview = {
        enable = true;
      };
    };
    extraPackages = with pkgs; [python312Packages.pylatexenc];
  };
}
