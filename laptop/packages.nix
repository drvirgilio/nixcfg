{ config, pkgs, ... }:

{
  config.nixpkgs.config.allowUnfree = true;
  config.environment.systemPackages = with pkgs; [
#   abiword
    acpi
    acpitool
    acpid
    anonymousPro
    arduino_core
    ascii
    asciidoc
    aspell
    aspellDicts.en
    audacity
    avrgcclibc
  # bitcoin
    blender
    bsdgames
  # cdrkit
    chatzilla
    chromium
  # conky
    cowsay
    cryptsetup
    ctags
    dbus_libs
    dia
    dmenu2
    dnsmasq
    dos2unix
  # dosbox
    duplicity
  # dwm
    dzen2
    epdfview
    espeak
    ethtool
    evtest
    fakeroot
    ffmpeg
    file
  # firefoxWrapper
    fluidsynth
    fop
    frescobaldi
    fuse_exfat
    ghostscript
    gimp
    gitAndTools.gitflow
    gitAndTools.gitFull
    #gitAndTools.gitAnnex
    gitg
    glxinfo
    gmrun
    gnash
    gnumake
    gnupg
  # gnuplot
    go
    gparted
    gptfdisk
    gutenprint
    haveged
  # haskellPackages.ghc
  # haskellPackages.haskellPlatform
  # haskellPackages.idris
  # herbstluftwm
    htop
    iftop
    imagemagick
    inetutils
    inkscape
    ino
    iotop
  # irssi
    jack2
    keychain
    kde4.ark
    kde4.konsole
    kde4.okular
    kde4.kdemultimedia
    kde4.kdegraphics
    kde4.kdeutils
    kde4.applications
    kde4.kdegames
    kde4.kdeedu
    kde4.kdebindings
    kde4.kdeaccessibility
    kde4.kde_baseapps
    kde4.kactivities
    kde4.kdeadmin
    kde4.kdeartwork
    kde4.kde_base_artwork
    kde4.kdenetwork
    kde4.kdepim
    kde4.kdepimlibs
    kde4.kdeplasma_addons
    kde4.kdesdk
    kde4.kdetoys
    kde4.kde_wallpapers
    kde4.kdewebdev
    kde4.oxygen_icons
    kde4.kdebase_workspace
    kde4.kdelibs
    kde4.kdevelop
    kde4.kdevplatform
  # keepassx2
    leocad
    libarchive
    libreoffice
    lilypond
    linuxPackages.perf
    lsof
    ltrace
    lyx
    manpages
    mc
    mercurial
    mesa
    mpd
    mplayer
  # mumble
  # mupen64plus
  # mutt
    ncmpcpp
  # neverball
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
    pidgin
    pidginotr
    pixman
    pkgconfig
    pmutils
    psmisc
    pv
    pwgen
    python
    qemu
    qjackctl
  # R
    rdiff_backup
    remind
    rpm
    ruby
    rustc
  # rxvt
    rxvt_unicode
  # samba
    screen
    scrot
    spidermonkey
    ssss
  # stalonetray
    stellarium
    syncthing
    tarsnap
    tcsh
  # telnet
  # texLiveBeamer
  # texLive
    thunderbird
    tor
    torbrowser
  # torchat
    transmission
    transmission_gtk
    trayer
    tree
  # unetbootin
    unrar
    unzip
    utillinuxCurses
  # verilog
    vidalia
  # vifm
    vim_configurable
    vlc
  # linuxPackages.virtualbox
    vlc
    w3m
    wayland
  # weston
    wget
    which
  # wicd
    wpa_supplicant_gui
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
  # xlibs.xorgserver
    xscreensaver
    xwayland
    zbar
    zip
    zsh
  # zsnes
  ];
}

