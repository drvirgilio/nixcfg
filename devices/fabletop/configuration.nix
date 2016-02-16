{ config, pkgs, ... } :
{
  system.replaceRuntimeDependencies = with pkgs.lib; [{
    original = pkgs.glibc;
    replacement = pkgs.stdenv.lib.overrideDerivation pkgs.glibc (oldAttr: {
      patches = oldAttr.patches ++ [(
        pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/development/libraries/glibc/cve-2015-7547.patch";
          sha256 = "0awpc4rp2x27rjpj83ps0rclmn73hsgfv2xxk18k82w4hdxqpp5r";
        }
      )];
    });
  }];

  require = [
    ../../modules/bash.nix
    ../../modules/gfx-pkgs.nix
    ../../modules/locale.nix
    ../../modules/security.nix
    ../../modules/std-env.nix
    ../../modules/std-nixpath.nix
    ../../modules/std-pkgs.nix
    ../../modules/std-services.nix
    ../../modules/xserver.nix
    ../../users/david.nix
  ];

  nix = {
    trustedBinaryCaches = [
      http://hydra.cryp.to
    ];
    binaryCachePublicKeys = [
      "hydra.cryp.to-1:8g6Hxvnp/O//5Q1bjjMTd5RO8ztTsG8DKPOAg9ANr2g="
    ];
  };

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

  services.xserver.videoDrivers = ["intel"];

  hardware.pulseaudio = {
    enable = true;
  };

  ######### KERNEL ###########
  #boot.kernelPackages = pkgs.linuxPackages_3_13;
  boot.initrd.kernelModules = [ "ehci_hcd" "ahci" "fbcon" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  nix.maxJobs = 4;

  ######## DRIVERS ##########
  hardware.bluetooth.enable = false;
  hardware.opengl = {
    driSupport32Bit = true;
    s3tcSupport = true;
  };

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
  boot.loader.gummiboot = {
    enable = true;
    timeout = 4;
  };

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
