{ config, pkgs, ... }:

{
  config.environment.systemPackages = with pkgs; [
    acpitool
#    firefox
    git
    ncmpcpp
    pwgen
    vim
    w3m
    zsh
  ];
}

