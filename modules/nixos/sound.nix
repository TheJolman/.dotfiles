{...}: {
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false; # it's this or pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
