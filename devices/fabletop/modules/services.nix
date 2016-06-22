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
    nixosManual.showManual = true;
    ntp.enable = true;
    openssh.enable = false;
    printing.enable = true;
    transmission.enable = false;
    udisks2.enable = true;
    upower.enable = true;
    xfs.enable = false;
  };
}
