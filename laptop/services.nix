{ config, pkgs, ... }:

{

  config.programs.ssh.startAgent = false;

  ######## SERVICES ##########
  config.services = {
    acpid.enable = true;
    mpd.enable = false;
    nixosManual.showManual = true;
    openssh = {
      enable = false;
      permitRootLogin = "no";
    };
    printing = {
      enable = true;
      #drivers = [ pkgs.gutenprint ];
    };
    transmission.enable = false;
    udisks2.enable = true;
    xserver = {
      videoDrivers = ["intel"];
      enable = true;
      #startGnuPGAgent = true;
      displayManager.slim.enable = true;
      desktopManager.xterm.enable = false;
      desktopManager.kde4.enable = true;
      desktopManager.default = "none";
      windowManager.default = "xmonad";
      #windowManager.herbstluftwm.enable = true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = self: [
          #self.xmonad
          self.xmonad-contrib
          self.xmonad-extras
          self.xmobar
        ];
      };
      defaultDepth = 24;
      autorun = true;
      exportConfiguration = true;
      xkbOptions = "terminate:ctrl_alt_bksp, numpad:mac";
      synaptics = {
        enable = true;
        #dev = "/dev/input/by-path/platform-i8042-serio-1-event-mouse";
        dev = "/dev/input/event4";
        accelFactor = "0.05";
        maxSpeed = "10";
        twoFingerScroll = true;
        additionalOptions =
        ''
          Option "HorizTwoFingerScroll" "1"
          Option "VertTwoFingerScroll"  "1"
          Option "VertScrollDelta"      "-80"
          Option "HorizScrollDelta"     "-70"
          #Option "CircularScrolling"    "on"
          #Option "CircScrollTrigger"    "0"
        '';
      };
    };
  };
}

