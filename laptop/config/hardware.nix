{ config, pkgs, ... }:

{
	######### KERNEL ###########
	imports = [ <nixos/modules/installer/scan/not-detected.nix> ];
	config.boot.kernelPackages = pkgs.linuxPackages_3_13;
	config.boot.initrd.kernelModules = [ "ehci_hcd" "ahci" "fbcon" ];
	config.boot.kernelModules = [ "kvm-intel" ];
	config.boot.extraModulePackages = [ ];
	config.nix.maxJobs = 4;

	######### AUDIO ###########
	config.hardware.pulseaudio.enable = true;

	######## DRIVERS ##########
	config.hardware.opengl = {
		videoDrivers = ["intel"];
		driSupport32Bit = true;
		s3tcSupport = true;
	};

	####### BOOTLOADER ########
	config.boot.loader.grub.enable = false;
	config.boot.loader.gummiboot = {
		enable = true;
		timeout = 4;
	};

	######## FILESYSTEMS ########
	config.fileSystems = [
		{ mountPoint = "/";
			device = "/dev/disk/by-uuid/59bb36fb-6ebe-4d10-8f83-32b6cac816a3";
			neededForBoot = true;
		}
#		{ mountPoint = "/boot";
#			device = "/dev/sda1";
#			neededForBoot = true;
#		}
	];
}
