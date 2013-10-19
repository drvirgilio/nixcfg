{ config, pkgs, ... }:

{
  config.environment.systemPackages = with pkgs; [
    acpitool
    firefox
    git
    gnupg
    go
    ncmpcpp
    pwgen
    vim
    w3m
    zsh
  ];
}

