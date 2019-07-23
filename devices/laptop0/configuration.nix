{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
    ];


  ### NETWORK ###
  networking = {
    hostName = "laptop0";
    wireless.enable = true; # wpa_supplicant
    firewall = {
      enable = true;
      allowPing = false;
      rejectPackets = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };


  ### LOCALE ###
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };
  time.timeZone = "America/Chicago";


  ### AUDIO ###
  boot.blacklistedKernelModules = [ "snd_pcsp" ];
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };


  ### BLUETOOTH ###
  hardware.bluetooth.enable = true;


  ### SERVICES ###
  services = {
    acpid.enable = true;
    dbus.enable = true;
    mpd.enable = false;
    nixosManual.showManual = false;
    ntp.enable = true;
    openssh.enable = false;
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint pkgs.foomatic_filters ];
    };
    pcscd.enable = true;
    syncthing.enable = true;
    transmission.enable = false;
    udev = {
      extraRules = ''
        # FT232 - USB <-> Serial Converter
        ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE:="0666"

        # STM32F3DISCOVERY rev A/B - ST-LINK/V2
        ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE:="0666"

        # STM32F3DISCOVERY rev C+ - ST-LINK/V2-1
        ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", MODE:="0666"
      '';
      packages = [ pkgs.yubikey-personalization ];
    };
    udisks2.enable = true;
    upower.enable = true;
    xfs.enable = false;
  };


  ### LUKS ###
  boot.initrd.luks.devices = [
    {
      # This is the hard drive of the laptop
      name = "luksroot";
      device = "/dev/disk/by-uuid/bc156b28-f5a7-483e-9c85-efcfee320ea6";
      preLVM = true;
      allowDiscards = true; # support TRIM commands
    }
  ];


  ### BOOTLOADER ###
  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  ######## DRIVERS ##########
  hardware.opengl = {
    driSupport32Bit = true;
    s3tcSupport = true;
  };

  ######## FONTS ############
  fonts = {
    fontconfig.enable = true;
    enableFontDir = true;
    fonts = [
      pkgs.anonymousPro
      #pkgs.bakoma_ttf
      #pkgs.corefonts
      #pkgs.cm_unicode
      #pkgs.junicode
      #pkgs.ucsFonts
      #pkgs.unifont
      #pkgs.vistafonts
    ];
  };

  ######## REDSHIFT #######
  services.redshift = {
    enable = false;
    latitude = "43.1";
    longitude = "-89.4";
    temperature = {
      day = 5500;
      night = 3700;
    };
    brightness = {
      day = "1";
      night = "1";
    };
  };

  ######## XSERVER #########
  services.xserver = {
    videoDrivers = ["intel"];
#    enable = true;
    layout = "us";
    displayManager = {
      sddm = {
#        enable = true;
        autoNumlock = true;
      };
    };
    desktopManager = {
      xterm.enable = false;
#      plasma5.enable = true;
      default = "none";
    };
    #windowManager = {
    #  default = "xmonad";
    #  xmonad = {
    #    enable = true;
    #    enableContribAndExtras = true;
    #    extraPackages = self: [
    #      self.xmonad-contrib
    #      self.xmonad-extras
    #      self.xmobar
    #    ];
    #  };
    #};
    defaultDepth = 24;
    autorun = false;
    exportConfiguration = false;
    xkbOptions = "terminate:ctrl_alt_bksp, numpad:mac";
    libinput.enable = true;
    synaptics = {
      enable = false;
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


  ### USERS ###
  users.mutableUsers = true;
  users.extraUsers = {
    david = {
      createHome = true;
      home = "/home/david";
      group = "users";
      extraGroups = [ "wheel" "storage" "audio" "dialout" "cups" ];
      shell = pkgs.bash;
      openssh.authorizedKeys.keyFiles = [];
    };
  };


  ### SECURITY ###
  hardware.u2f.enable = true;
  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };


  system.stateVersion = "19.03";
}
