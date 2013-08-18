
{ config, pkgs, ... }:

{

  ######## SERVICES #########
  
  services = {
    # Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      permitRootLogin = "no";
    };
    mpd.enable = true;
    transmission.enable = true;
    
  };
  

  ######## USERS #########
  
  users.extraUsers = {
    david = {
      createHome = true;
      home = "/home/david";
      group = "users";
      extraGroups = [ "wheel" ];
      shell = "/bin/sh";
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAt/9IoMRVEwIfddlZZGrhXL98AQ/SXmezijO803PQSFxDP4r/gLbPPIR1oD0dNfEhSZmcFtzvRcCE7Z3mCRUOH6/J76MElfYMEXprup7sc02C3YM1zgT4arQwuRQXQSRgu9Xd1Bq5m2CWz+YOvwBYToniegC98qW9TrBSvOvAjSF6ZZT/hwesgvhy2FTytAzGHoD4tpbWrVXwNjeqUaJ3Zy8lI4Je/fg+hdFwP1w4L9plrn09JqQXmasQEuzCBx+1fbDSJk6sgMrgflm/KfNV8jV9qp5BrYhy8YNFtzAN9g0UqCH4bgLTOCVKahR5LMyDPoSHBz6flWhiSRc64BaHGw== David@LAPTOP" ];
    };
  };


  ######## PACKAGES #########
  environment.systemPackages = with pkgs; [
    ncmpcpp
  ];


  ####### SECURITY ##########
  security.pam.enableSSHAgentAuth = true;


  ######## NETWORK ##########

  networking = {
#    networkManager.enable = true;
    hostName = "nixos"; # Define your hostname.
    firewall = {
      enable = true;
      allowedTCPPorts = [ 
        80    # http 
        443   # https
        6600  # mpd
      ];
      allowPing = true;
    };
  #  wireless.enable = true;  # Enables Wireless.
  };


  ######### SOUND ###########

#  hardware.pulseaudio.enable = true;


  ###### LUKS PARTITION ######
  
  boot.initrd.luks.devices = [ 
     { name = "nixos"; device = "/dev/disk/by-partlabel/nixos"; }
  ];

  
  ######## HARDWARE ##########

  require =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.initrd.kernelModules =
    [ # Specify all kernel modules that are necessary for mounting the root
      # filesystem.
      # "xfs" "ata_piix"
    ];
    

  ########## GRUB ############

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/disk/by-id/usb-Generic_Flash_Disk_CCBB1208061449532504490601-0\:0";

  
  ######### FILESYSTEM ##########

  # Add filesystem entries for each partition that you want to see
  # mounted at boot time.  This should include at least the root
  # filesystem.

  fileSystems."/".device = "/dev/mapper/nixos";
  fileSystems."/boot".device = "/dev/disk/by-label/nixboot";

  # fileSystems."/data" =     # where you want to mount the device
  #   { device = "/dev/sdb";  # the device
  #     fsType = "ext3";      # the type of the partition
  #     options = "data=journal";
  #   };

  # List swap partitions activated at boot time.
  swapDevices =
    [ # { device = "/dev/disk/by-label/swap"; }
    ];

  ########### LOCALIZATION ###########

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_DK.UTF-8";
  };
  
  # Timezone
  time.timeZone = "America/Chicago";

}
