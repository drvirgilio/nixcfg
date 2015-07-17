{ config, pkgs, ... } :
with pkgs.lib;
{
  users.extraUsers = {
    david = {
      createHome = true;
      home = "/home/david";
      group = "users";
      extraGroups = [ "wheel" "audio" "dialout" "cups" ];
      shell = "/bin/sh";
      openssh.authorizedKeys.keyFiles = [];
    };
  };
}
