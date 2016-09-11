{ pkgs, lib, ... }:

let
  nvim = pkgs.neovim.override {
    vimAlias = false;
    configure = (import ./customization.nix { pkgs = pkgs; });
  };

in
  [
    nvim
    pkgs.ctags
  ]
