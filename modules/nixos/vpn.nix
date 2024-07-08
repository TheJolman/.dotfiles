{ config, lib, pkgs, ... }: {
  # services.openvpn = {
  #   servers = {
  #     proton = {
  #       autoStart = false;
  #       # TODO put vpn files somewhere better or move config here.
  #       config = "config /home/josh/downloads/openvpn/UDP/us.protonvpn.udp.ovpn";
  #     };
  #   };
  # };
  networking.wireguard = {
    enable = true;
    # interfaces.protonvpn = {
    # };
  };
}
