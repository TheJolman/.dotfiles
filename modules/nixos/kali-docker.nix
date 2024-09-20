{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.kali-docker;
in {
  options.services.kali-docker = {
    enable = mkEnableOption "Kali Linux Docker container service";

    dataDir = mkOption {
      type = types.str;
      default = "/var/lib/kali-docker";
      description = "Directory to store persistent Kali data";
    };

    containerName = mkOption {
      type = types.str;
      default = "kali-container";
      description = "Name of the Kali Docker container";
    };

    imageName = mkOption {
      type = types.str;
      default = "kalilinux/kali-rolling";
      description = "Docker image to use for Kali Linux";
    };

    extraPackages = mkOption {
      type = types.listOf types.str;
      default = [];
      example = [ "nmap" "metasploit-framework" ];
      description = "Additional packages to install in the Kali container";
    };

    users = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "List of users to add to the docker group";
    };
  };

  config = mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };

    systemd.services.kali-docker-setup = {
      description = "Setup Kali Linux Docker Container";
      wantedBy = [ "multi-user.target" ];
      requires = [ "docker.service" ];
      after = [ "docker.service" ];
      script = ''
        ${pkgs.docker}/bin/docker pull ${cfg.imageName}
        ${pkgs.docker}/bin/docker volume create kali-data
      '';
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
    };

    environment.systemPackages = [ pkgs.docker ];

    environment.shellAliases = {
      kali = ''
        ${pkgs.docker}/bin/docker run --network host -it --rm \
          --name ${cfg.containerName} \
          -v kali-data:/persistence \
          -v ${cfg.dataDir}:/host-data \
          ${cfg.imageName} /bin/bash -c "
            apt update && apt install -y ${toString cfg.extraPackages}
            /bin/bash
          "
      '';
    };

    system.activationScripts.kaliDockerSetup = ''
      mkdir -p ${cfg.dataDir}
      chmod 755 ${cfg.dataDir}
    '';

    users.groups.docker.members = cfg.users;

    security.sudo.extraRules = [
      {
        users = cfg.users;
        commands = [
          {
            command = "${pkgs.docker}/bin/docker";
            options = [ "NOPASSWD" ];
          }

        ];

      }

    ];
  };
}
