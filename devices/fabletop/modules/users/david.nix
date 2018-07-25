{ config, pkgs, ... } :
with pkgs.lib;
{
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
}
