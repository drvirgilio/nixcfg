{ config, pkgs, ... }:

{
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
			];
		};
	};
}

