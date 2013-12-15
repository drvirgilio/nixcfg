{ config, pkgs, ... }:

{
  config.environment.systemPackages = with pkgs; [
    acpitool
    firefox
    git
    gnupg
    go
    haskellPackages.ghc
    haskellPackages.haskellPlatform
    ncmpcpp
    pwgen
    vim
    w3m
    zsh
  ];

}

