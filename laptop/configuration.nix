{ config, pkgs, ... }:

{
  ######### IMPORTS ###########
  imports = [
    ./hardware.nix
    ./packages.nix
    ./services.nix
  ];

  ######## LOCALIZATION ########
  config.time.timeZone = "America/Chicago";
  config.i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_DK.UTF-8";
  };

  ######### USERS ##########
  config.users.extraUsers = {
    david = {
      createHome = true;
      home = "/home/david";
      group = "users";
      extraGroups = [ "wheel" "audio" "dialout" "cups" ];
      shell = "/bin/sh";
    };
  };

  ######## NETWORK #########
  config.networking = {
    wireless.enable = true;
    hostName = "fabletop";
    firewall = {
      enable = true;
      allowPing = true;
      rejectPackets = true;
      allowedTCPPorts = [
        80    # http
        443   # https
        587   # smtps
        7000  # irc
        #6600 # mpd
        51413 # bittorrent
      ];
    };
  };

  ############## BASH ################
  config.programs.bash.enableCompletion = true;
  config.programs.bash.promptInit = ''
    # Provide a nice prompt
    PROMPT_COLOR="1;31m"
    let $UID && PROMPT_COLOR="1;32m"
    PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\n\\$\[\033[0m\] "
    if test "$TERM" = "xterm"; then
    PS1="\[\033]2;\h:\u:\w\007\]$PS1"
    fi
  '';

  ############# SECURITY ############
  config.security.polkit = {
    enable = true;
    extraConfig = ''
/* Log authorization checks. */
polkit.addRule(function(action, subject) {
  polkit.log("user " + subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
});

/*
polkit.addRule(function(action, subject) {
  var YES = polkit.Result.YES;
  var permission = {
    // only required for udisks2:
    "org.freedesktop.udisks2.filesystem-mount": YES,
    "org.freedesktop.udisks2.filesystem-mount-system": YES,
    "org.freedesktop.udisks2.encrypted-unlock": YES,
    "org.freedesktop.udisks2.eject-media": YES,
    "org.freedesktop.udisks2.power-off-drive": YES
  };
  if (subject.isInGroup("storage")) {
    return permission[action.id];
  }
}); */
'';

  };

}
