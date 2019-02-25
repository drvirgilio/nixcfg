{ config, pkgs, ... } :
{

  require = [

    ./modules/graphics.nix
    ./modules/packages.nix
    ./modules/nixpath.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/shell.nix
    ./modules/users/david.nix
  ];

  system.stateVersion = "18.03";

  programs.adb.enable = true;
  programs.ssh.startAgent = false;
  users.mutableUsers = true;

  hardware.u2f.enable = true;

  ##### LOCALE #####
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };
  time.timeZone = "America/Chicago";

  ##### NETWORK #####
  networking = {
    wireless.enable = true;
    hostName = "fabletop";
    firewall = {
      enable = true;
      allowPing = true;
      rejectPackets = true;
      allowedTCPPorts = [
        80    # http
        443   # https
        587   # smtps
        7000  # irc
        #6600 # mpd
        51413 # bittorrent
      ];
    };
  };

  ##### AUDIO #####
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  #### BLUETOOTH #####
  hardware.bluetooth.enable = true;

  ######### KERNEL ###########
  #boot.kernelPackages = pkgs.linuxPackages_3_13;
  boot.initrd.kernelModules = [ "ehci_hcd" "ahci" "fbcon" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  nix.maxJobs = 4;

  ###### LUKS PARTITION ######
  boot.initrd.luks.devices = [
    {
      # This is the hard drive of the laptop
      name = "luksroot";
      device = "/dev/disk/by-uuid/7f83f54e-f80c-4058-9308-85132c702b4b";
      preLVM = true;
      allowDiscards = true; # support TRIM commands
    }
  ];

  ####### BOOTLOADER ########
  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 4;

  ######## FILESYSTEMS ########
  fileSystems = [
    {
      mountPoint = "/";
      device = "/dev/disk/by-uuid/20af57ce-520d-441a-ab94-d8d0ca9ae4ed";
      fsType = "ext4";
      options = ["defaults" "relatime" "discard"];
      neededForBoot = true;
    }
    {
      mountPoint = "/boot";
      device = "/dev/disk/by-uuid/5CC6-C944";
      fsType = "vfat";
      options = ["defaults" "relatime" "discard"];
      neededForBoot = false;
    }
    {
      mountPoint = "/home";
      device = "/dev/disk/by-uuid/c7f9c351-6721-4a58-8c85-ed00a54918ba";
      fsType = "ext4";
      options = ["defaults" "relatime" "discard"];
      neededForBoot = false;
    }
    {
      mountPoint = "/tmp";
      device = "tmpfs";
      fsType = "tmpfs";
      options = ["nosuid" "nodev" "relatime"];
    }
  ];

  ########### SWAP ###########
  swapDevices = [
    {
      device = "/dev/disk/by-uuid/ccd1b225-d70f-4cea-bb79-a96b0a23c941";
    }
  ];


}
