{ config, pkgs, ... }:

{
  ######### KERNEL ###########
  #imports = [ <nixos/modules/installer/scan/not-detected.nix> ];
  #config.boot.kernelPackages = pkgs.linuxPackages_3_13;
  config.boot.initrd.kernelModules = [ "ehci_hcd" "ahci" "fbcon" ];
  config.boot.kernelModules = [ "kvm-intel" ];
  config.boot.extraModulePackages = [ ];
  config.nix.maxJobs = 4;

  ######## DRIVERS ##########
  config.hardware.bluetooth.enable = false;
  config.hardware.opengl = {
#   videoDrivers = ["intel"];
    driSupport32Bit = true;
    s3tcSupport = true;
  };

  ######### AUDIO ###########
  config.hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudio.override { jackaudioSupport = true; };
  };

  ###### LUKS PARTITION ######
  config.boot.initrd.luks.devices = [
    {
      # This is the hard drive of the laptop
      name = "luksroot";
      device = "/dev/sda2";
      preLVM = true;
      allowDiscards = true; # support TRIM commands
    }
  ];

  ####### BOOTLOADER ########
  config.boot.loader.grub.enable = false;
  config.boot.loader.gummiboot = {
    enable = true;
    timeout = 4;
  };

  ######## FILESYSTEMS ########
  config.fileSystems = [
    {
      mountPoint = "/";
      device = "/dev/disk/by-uuid/20af57ce-520d-441a-ab94-d8d0ca9ae4ed";
      fsType = "ext4";
      options = "defaults,relatime,discard";
      neededForBoot = true;
    }
    {
      mountPoint = "/boot";
      device = "/dev/sda1";
      fsType = "vfat";
      options = "defaults,relatime,discard";
      neededForBoot = false;
    }
    {
      mountPoint = "/home";
      device = "/dev/disk/by-uuid/c7f9c351-6721-4a58-8c85-ed00a54918ba";
      fsType = "ext4";
      options = "defaults,relatime,discard";
      neededForBoot = false;
    }
    {
      mountPoint = "/tmp";
      device = "tmpfs";
      fsType = "tmpfs";
      options = "nosuid,nodev,relatime";
    }
  ];

  ########### SWAP ###########
  config.swapDevices = [
    {
      device = "/dev/disk/by-uuid/ccd1b225-d70f-4cea-bb79-a96b0a23c941";
    }
  ];
}
