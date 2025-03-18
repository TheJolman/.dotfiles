{
  inputs,
  pkgs,
  ...
}: {
  users = {
    defaultUserShell = pkgs.zsh;
    users.josh = {
      isNormalUser = true;
      group = "josh";
      description = "Joshua Holman";
      extraGroups = ["networkmanager" "wheel"];
    };
    groups.josh = {};
  };

  programs.zsh.enable = true;
  networking.networkmanager.enable = true;

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  programs.nix-ld.enable = true;

  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    config = {
      common.default = ["hyprland" "gtk"];
      hyprland.default = ["hyprland" "gtk"];
    };
    extraPortals = with pkgs; [
      # xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
    greetd.tuigreet
    p7zip
  ];

  time.timeZone = "America/Los_Angeles";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
}
