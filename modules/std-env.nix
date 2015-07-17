{ config, pkgs, lib, ... } :
with lib;
{
  config = {

    programs.ssh.startAgent = false;

    environment.shellInit = ''
      export LC_ALL=${config.i18n.defaultLocale}
    '';

    time.timeZone = "America/Chicago";

    security.sudo.enable = true;
    security.sudo.wheelNeedsPassword = false;

    users.mutableUsers = true;
  };
}
