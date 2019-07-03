{ config, pkgs, lib, ... } :
with lib;
{
  config = {
    boot.blacklistedKernelModules = [ "snd_pcsp" ];
    sound.enable = true;
  };

  config.services = {
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
}
