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

  ######### USERS ##########
  config.users.extraUsers = {
    david = {
      createHome = true;
      home = "/home/david";
      group = "users";
      extraGroups = [ "wheel" ];
      shell = "/bin/sh";
    };
    work = {
      createHome = true;
      home = "/home/work";
      group = "users";
      shell = "/bin/sh";
    };
    track = {
      createHome = false;
    };
  };

  ######### PACKAGES ########
  config.environment.systemPackages = with pkgs; [
    git
    ncmpcpp
    pwgen
    w3m
  ];  

  ######## NETWORK ##########
  config.networking = {
    wireless.enable = true;
    hostName = "nixtop";
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [
        80   # http
        443  # https
        6600 # mpd
      ];
    };
  };

  ######## HARDWARE ##########
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  ####### BOOTLOADER ########
  # Dont Use the GRUB 2 boot loader.
  config.boot.loader.grub.enable = false;

  # use gummiboot
  config.boot.loader.gummiboot = {
    enable = true;
    timeout = 4;
  };

  ######## FILESYSTEMS ########
  config.fileSystems = [
    { mountPoint = "/";
      device = "/dev/disk/by-uuid/59bb36fb-6ebe-4d10-8f83-32b6cac816a3";
      neededForBoot = true;
    }
    { mountPoint = "/boot";
      device = "/dev/disk/by-uuid/1D71-AD82";
      neededForBoot = true;
    }
  ];

  ######## LOCALIZATION ########
  config.time.timeZone = "America/Chicago";
  config.i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_DK.UTF-8";
  };

}
