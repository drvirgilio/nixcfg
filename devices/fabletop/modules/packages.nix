{ config, pkgs, lib, ... } :
with lib;
{

  nixpkgs.config = {
    allowUnfree = true;
    firefox = {
      enableAdobeFlash = true;
      icedtea = true;
    };
    chromium = {
      enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
      enablePepperPDF = true;
    };
  };
  environment.systemPackages = with pkgs; [
  #### COMMAND LINE ####
    abcde
    acpi
    acpid
    anonymousPro
    ascii
    aspell
    aspellDicts.en
    bc
    cryptsetup
    dbus_libs
    dos2unix
    espeak
    ethtool
    fakeroot
    ffmpeg
    file
    flac
    fluidsynth
    fop
    fuse_exfat
    ghostscript
    gitAndTools.gitflow
    gitAndTools.gitFull
    gnumake
    gnupg1compat
    gptfdisk
    haveged
    htop
    iftop
    imagemagick
  # inetutils
    iotop
    jq
    libarchive
    linuxPackages.perf
    lsof
    ltrace
    manpages
    mercurial
    ngrep
    nix-prefetch-scripts
    nix-repl
    nmap
    opusTools
    p7zip
    pass
    patchelf
    pixman
    pkgconfig
    pmutils
    psmisc
    pv
    pwgen
    python
    qrencode
    rhash
    screen
    scrypt
    socat
    sqlite
    ssss
    tarsnap
    tor
  # transmission
    tree
    unrar
    unzip
    utillinuxCurses
    vim_configurable
    wget
    which
    wireshark-cli
    zbar
    zip
    zsh

  #### GRAPHICAL ####
    chromium
    dmenu2
    dzen2
    epdfview
    firefoxWrapper
    gparted
    kde4.konsole
    kde4.okular
    kde4.quasselClient
    mesa
    mplayer
    pavucontrol
    qemu
    scrot
    thunderbird
    torbrowser
    transmission_gtk
    trayer
    vidalia
    vlc
    xawtv
    xbindkeys
    xcalib
    xclip
    xdotool
    xlibs.xbacklight
    xlibs.xev
    xlibs.xkbcomp
    xlibs.xkbutils
    xlibs.xkill
    xlibs.xmodmap
    xscreensaver
  ];
}

