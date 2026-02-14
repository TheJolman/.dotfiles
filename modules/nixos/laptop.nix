{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    types
    ;
  cfg = config.laptop;
in {
  imports = [
    ./tlp.nix
    ./fprintd.nix
  ];

  options.laptop = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Enables laptop specific settings, like TLP power profiles and lid switch behavior.
      '';
    };
    enableFingerprintReader = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Enables fprintd.
      '';
    };
  };

  config = {
  };
}
