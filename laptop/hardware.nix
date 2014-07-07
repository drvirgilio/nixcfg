{ config, pkgs, ... }:

{
	######### KERNEL ###########
	#imports = [ <nixos/modules/installer/scan/not-detected.nix> ];
	#config.boot.kernelPackages = pkgs.linuxPackages_3_13;
	config.boot.initrd.kernelModules = [ "ehci_hcd" "ahci" "fbcon" ];
	config.boot.kernelModules = [ "kvm-intel" ];
	config.boot.extraModulePackages = [ ];
	config.nix.maxJobs = 4;

	######## DRIVERS ##########
	config.hardware.opengl = {
#		videoDrivers = ["intel"];
		driSupport32Bit = true;
		s3tcSupport = true;
	};

	######### AUDIO ###########
	config.hardware.pulseaudio.enable = true;

	###### LUKS PARTITION ######
	config.boot.initrd.luks.devices = [
		{
			# This is the hard drive of the laptop
			name = "luksroot";
			device = "/dev/sda2";
			preLVM = true;
		}
	];

	####### BOOTLOADER ########
	config.boot.loader.grub.enable = false;
	config.boot.loader.gummiboot = {
		enable = true;
		timeout = 4;
	};

	######## FILESYSTEMS ########
	config.fileSystems = [
		{
			mountPoint = "/";
			device = "/dev/disk/by-uuid/037ec17e-8cbb-4eae-86d2-b7f237579a93";
			neededForBoot = true;
		}
		{
			mountPoint = "/boot";
			device = "/dev/sda1";
			neededForBoot = false;
		}
		{
			mountPoint = "/home";
			device = "/dev/disk/by-uuid/8f98873c-9a51-416d-9138-1cd46279579e";
			neededForBoot = false;
		}
		{
			mountPoint = "/tmp";
			device = "tmpfs";
			fsType = "tmpfs";
			options = "nosuid,nodev,relatime";
		}
	];

	########### SWAP ###########
	config.swapDevices = [
		{
			device = "/dev/disk/by-uuid/17a3a0bd-c200-4518-a64d-838611832e4c";
		}
	];
}
