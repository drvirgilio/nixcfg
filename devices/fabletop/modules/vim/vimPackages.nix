{ pkgs, lib, ... }:

let
  customization = {
    vimrcConfig = (import ./customization.nix { pkgs = pkgs; });
  } // { name = "vim"; };

  custom_vim = pkgs.vim_configurable.customize customization;

  vim = custom_vim;

in
  [
    vim
  ]
