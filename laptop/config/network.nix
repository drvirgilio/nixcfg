{ config, pkgs, ... }:

{
  config.networking = {
    wireless.enable = false;
    hostName = "fabletop";
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [
        80    # http
        443   # https
        #6600 # mpd
      ];
    };
  };
}

