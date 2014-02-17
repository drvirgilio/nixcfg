{ config, pkgs, ... }:

{
	######## IMPORTS ###########
	imports = [
		./config/packages.nix
		./config/hardware.nix
		./config/network.nix
		./config/services.nix
		./config/locale.nix
		./config/users.nix
	];
}
