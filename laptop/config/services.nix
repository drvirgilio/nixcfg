{ config, pkgs, ... }:

{
  ######## SERVICES ##########
  config.services = {
    mpd.enable = true;
    xserver = {
      enable = true;
      defaultDepth = 24;
      videoDrivers = ["intel"];
      autorun = false;
      startOpenSSHAgent = false;
      exportConfiguration = true;
      synaptics = {
        enable = true;
        dev = "/dev/input/mouse0";
      };
    };
  };
}
