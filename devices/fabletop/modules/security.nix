{ config, pkgs, ... } :
{
  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
    polkit = {
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
  };
}
