{ config, pkgs, ... }:

{
  ######## LOCALIZATION ########
  config.time.timeZone = "America/Chicago";
  config.i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_DK.UTF-8";
  };
}
