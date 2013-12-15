{ config, pkgs, ... }:

{
  ######## SERVICES ##########
  config.services = {
    acpid = {
      enable = true;
      powerEventCommands = ''
        echo -n mem > /sys/power/state
      '';
    };
    printing.enable = true;
    mpd.enable = true;
    transmission.enable = true;
    xserver = {
      enable = true;
      displayManager.slim.enable = true;
      desktopManager.kde4.enable = true;
      desktopManager.xterm.enable = false;
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
