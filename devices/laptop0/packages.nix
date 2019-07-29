{ config, pkgs, ... }:

{
  ### PROGRAMS ###
  nixpkgs.config.android_sdk.accept_license = true;
  programs.adb.enable = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  # programs.ssh.startAgent = false;
  programs.firejail.enable = true;
  programs.mosh.enable = true;
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      xwayland
      #rxvt_unicode
      dmenu
      alacritty
      waybar
    ];
  };

  environment.systemPackages = with pkgs; [
    ### COMMAND LINE ###
    abcde           # audio CD ripper
    acpi            # battery info
    ascii           # print ascii table
    aspell          # spell checking
    aspellDicts.en  # spell check dictionary
    bench           # benchmarking tool
    borgbackup      # backup utility
    firejail
    gitAndTools.gitFull
    gnupg
    gptfdisk        # gdisk command to edit gpt partition table
    haveged
    hexedit
    html-tidy       # cleans up html
    htop            # process viewer
    iftop           # bandwidth viewer
    imagemagick     # edit images
    iotop           # display process io usage
    ncdu            # disk usage analyzer
    nix-prefetch-scripts
    nmap            # network analyzer/scanner
    p7zip           # 7z archiver
    (pass.withExtensions (ext: with ext; [ pass-tomb pass-update ]))
    pavucontrol     # Sound control for PulseAudio
    pciutils        # lspci, setpci
    picocom         # serial port terminal
    pv              # pipe progress monitor
    pwgen           # password generator
    qrencode        # qr code generator
    rhash           # utility for computing and verifying hash sums
    samba           # windows share
    srm             # secure file remove
    tree            # print file tree
    usbutils        # lsusb, usb-devices, usbhid-dump
    vim
    wget            # download file from URL
    yubikey-personalization   # yubikey tools
    zbar            # bar code reader

    ### GRAPHICAL ###
    imv             # image viewer
    xorg.xev        # get info about keyboard input
  ];
}
