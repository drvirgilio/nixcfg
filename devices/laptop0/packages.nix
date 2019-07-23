{ config, pkgs, ... }:

{
  ### PROGRAMS ###
  nixpkgs.config.android_sdk.accept_license = true;
  programs.adb.enable = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  # programs.ssh.startAgent = false;
  programs.firejail.enable = true;
  environment.systemPackages = with pkgs; [
    ascii
    firejail
    gitAndTools.gitFull
  ];
}
