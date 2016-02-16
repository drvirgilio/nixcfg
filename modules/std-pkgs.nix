{ config, pkgs, lib, ... } :
with lib;
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    acpi
    #acpitool
    acpid
    anonymousPro
    arduino_core
    ascii
    asciidoc
    aspell
    aspellDicts.en
    avrgcclibc
    bc
    bsdgames
    cowsay
    cryptsetup
    ctags
    dbus_libs
    dnsmasq
    dos2unix
  # dosbox
    #duplicity
    espeak
    ethtool
    evtest
    fakeroot
    ffmpeg
    file
    fluidsynth
    fop
    fuse_exfat
    ghostscript
    gitAndTools.gitflow
    gitAndTools.gitFull
    #gitAndTools.gitAnnex
    gnumake
    gnupg
  # gnuplot
    go
    gparted
    gptfdisk
    #gutenprint
    haveged
  #  haskellPackages.cabal2nix
  # haskellPackages.ghc
  # haskellPackages.haskellPlatform
  # haskellPackages.idris
    htop
    iftop
    imagemagick
    inetutils
    ino
    iotop
  # irssi
  # jack2
    jq
    keychain
    libarchive
  # lilypond
    linuxPackages.perf
    lsof
    ltrace
    manpages
    mc
    mercurial
    mpd
    mplayer
  # mumble
  # mutt
    ncmpcpp
    ngrep
    nix-prefetch-scripts
    nix-repl
    nmap
  # nodejs
    ntp
    obnam
    octave
    openconnect
  # openjdk
    opusTools
    p7zip
    pass
    patchelf
    pavucontrol
    picocom
    pixman
    pkgconfig
    pmutils
    psmisc
    pv
    pwgen
    python
  # R
    rdiff_backup
    remind
    rpm
    ruby
  # rustc
  # samba
    screen
    spidermonkey
    sqlite
    ssss
    syncthing
    tarsnap
    tcsh
  # telnet
  # texLiveBeamer
  # texLive
    tor
  # torchat
    transmission
    tree
  # unetbootin
    unrar
    unzip
    utillinuxCurses
  # verilog
  # vifm
    vim_configurable
  # linuxPackages.virtualbox
    w3m
  # weston
    wget
    which
  # wicd
    wireshark-cli
    zbar
    zip
    zsh
  ];
}
