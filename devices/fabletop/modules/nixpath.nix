{ config, pkgs, lib, ... } :
with lib;
{
  options = {
    environment.nixConfigsDir = mkOption {
      default = "/home/david/nixcfg";
      type = with types; string;
    };
    environment.nixPkgsDir = mkOption {
      default = "/home/david/nixpkgs";
      type = with types; string;
    };
  };

  config = {
    nix.nixPath =
      let cfgdir = config.environment.nixConfigsDir;
          pkgsdir = config.environment.nixPkgsDir;
          hostname = config.networking.hostName;
      in
        [ "/home/david" "nixos-config=${cfgdir}/devices/${hostname}/configuration.nix" ];

  };
}
