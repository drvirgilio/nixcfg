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
			extraGroups = [ "wheel" "mpd" "audio" "dialout" ];
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
				#6600 # mpd
				51413 # bittorrent
			];
		};
	};

}
