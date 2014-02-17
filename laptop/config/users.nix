{ config, pkgs, ... }:

{
	######### USERS ##########
	config.users.extraUsers = {
		david = {
			createHome = true;
			home = "/home/david";
			group = "users";
			extraGroups = [ "wheel" "transmission" "mpd" ];
			shell = "/bin/sh";
		};
		work = {
			createHome = true;
			home = "/home/work";
			group = "users";
			shell = "/bin/sh";
		};
		track = {
			createHome = false;
		};
	};
}
