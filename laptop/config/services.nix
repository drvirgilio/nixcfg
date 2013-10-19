{ config, pkgs, ... }:

{
  ######## SERVICES ##########
  config.services = {
    acpid.enable = true;
    mpd.enable = true;
    xserver = {
      enable = true;
      desktopManager.kde4.enable = true;
      defaultDepth = 24;
      videoDrivers = ["intel"];
      autorun = true;
      startOpenSSHAgent = false;
      exportConfiguration = true;
      synaptics = {
        enable = true;
        dev = "/dev/input/mouse0";
      };
    };
  };
}
