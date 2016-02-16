{ config, pkgs, lib, ... } :
with lib;
{
  nixpkgs.config.firefox = {
    enableAdobeFlash = true;
    icedtea = true;
  };

  nixpkgs.config.chromium = {
    enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
    enablePepperPDF = true;
  };

  environment.systemPackages = with pkgs; [
#   abiword
    audacity
  # bitcoin
    blender
  # cdrkit
    chromium
    #chatzilla
  # conky
    dia
    dmenu2
  # dwm
    dzen2
    epdfview
    firefoxWrapper
  # frescobaldi
    gimp
    gitg
    glxinfo
    gmrun
  # gnash
    #haskellPackages.xmobar
  # herbstluftwm
    inkscape
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
  # kde4.kdesdk
    kde4.kdetoys
    kde4.kde_wallpapers
    kde4.kdewebdev
    kde4.oxygen_icons
    kde4.kdebase_workspace
    kde4.kdelibs
    kde4.kdevelop
    kde4.kdevplatform
    kde4.quasselClient
    leocad
  # keepassx2
  # libreoffice
    lyx
    mesa
  # mupen64plus
  # neverball
    pidgin
    pidginotr
    qemu
    qjackctl
  # rxvt
    rxvt_unicode
    scrot
  # stalonetray
    stellarium
    thunderbird
    torbrowser
    transmission_gtk
    trayer
    vidalia
    vlc
    wayland
    wpa_supplicant_gui
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
  # xlibs.xorgserver
    xscreensaver
  # xwayland
  # zsnes
  ];
}
