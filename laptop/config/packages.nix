{ config, pkgs, ... }:

{
	config.environment.systemPackages = with pkgs; [
		acpitool
		firefox
		git
		gnupg
		go
		haskellPackages.ghc
		haskellPackages.haskellPlatform
		kde4.kdemultimedia
		kde4.kdegraphics
		kde4.kdeutils
		kde4.applications
		kde4.kdegames
		kde4.kdeedu
		kde4.kdebindings
		kde4.kdeaccessibility
		kde4.kde_baseapps
		kde4.kactivities
		kde4.kdeadmin
		kde4.kdeartwork
		kde4.kde_base_artwork
		kde4.kdenetwork
		kde4.kdepim
		kde4.kdepimlibs
		kde4.kdeplasma_addons
		kde4.kdesdk
		kde4.kdetoys
		kde4.kde_wallpapers
		kde4.kdewebdev
		kde4.oxygen_icons
		kde4.kdebase_workspace
		kde4.kdelibs
		kde4.kdevelop
		kde4.kdevplatform
		ncmpcpp
		pwgen
		vim
		w3m
		zsh
	];

}

