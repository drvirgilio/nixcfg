{ config, pkgs, ... }:

{
	######## SERVICES ##########
	config.services = {
		acpid = {
			enable = true;
			powerEventCommands = ''
				echo -n mem > /sys/power/state
			'';
		};
		printing.enable = false;
		mpd.enable = false;
		nixosManual.showManual = true;
		transmission.enable = false;
		openssh = {
			enable = false;
			permitRootLogin = "no";
		};
		xserver = {
			enable = true;
			displayManager.slim.enable = true;
			displayManager.sessionCommands = ''
				if ! $(pidof -x "gpg-agent" >/dev/null); then
					eval $(gpg-agent --daemon --enable-ssh-support \
						--write-env-file "~/.gpg-agent-info")
				fi
			'';
			desktopManager.xterm.enable = false;
			desktopManager.kde4.enable = true;
			windowManager.herbstluftwm.enable = true;
			defaultDepth = 24;
			autorun = false;
			startOpenSSHAgent = false;
			exportConfiguration = true;
			synaptics = {
				enable = true;
				#dev = "/dev/input/by-path/platform-i8042-serio-1-event-mouse";
				dev = "/dev/input/event4";
				accelFactor = "0.05";
				maxSpeed = "10";
				twoFingerScroll = true;
				additionalOptions =
				''
					Option "HorizTwoFingerScroll" "1"
					Option "VertTwoFingerScroll"  "1"
					Option "VertScrollDelta"      "-80"
					Option "HorizScrollDelta"     "-70"
					#Option "CircularScrolling"    "on"
					#Option "CircScrollTrigger"    "0"
				'';
			};
		};
	};
}
