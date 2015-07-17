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
    environment.shellInit =
      let cfgdir = config.environment.nixConfigsDir;
          pkgsdir = config.environment.nixPkgsDir;
          hostname = config.networking.hostName;
      in ''
      NIX_PATH=nixos=${pkgsdir}/nixos
      NIX_PATH=$NIX_PATH:nixpkgs=${pkgsdir}
      NIX_PATH=$NIX_PATH:nixos-config=${cfgdir}/devices/${hostname}/configuration.nix
      export NIX_PATH
      '';
  };
}
