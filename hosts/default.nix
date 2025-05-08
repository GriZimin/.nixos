# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
	[ # Include the results of the hardware scan.
		./hardware-configuration.nix
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

    services.displayManager.sddm.wayland.enable = true;

    programs.zsh.enable = true;

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
    boot.loader.timeout = 10;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixzimin"; # Define your hostname.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	#networking.proxy.default = "127.0.0.1:2080";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Asia/Yekaterinburg";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "ru_RU.UTF-8";
		LC_IDENTIFICATION = "ru_RU.UTF-8";
		LC_MEASUREMENT = "ru_RU.UTF-8";
		LC_MONETARY = "ru_RU.UTF-8";
		LC_NAME = "ru_RU.UTF-8";
		LC_NUMERIC = "ru_RU.UTF-8";
		LC_PAPER = "ru_RU.UTF-8";
		LC_TELEPHONE = "ru_RU.UTF-8";
		LC_TIME = "ru_RU.UTF-8";
	};

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.grizimin = {
		isNormalUser = true;
		description = "grizimin";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
        home-manager
		neovim 		
        wget
		git
		firefox
		rofi-wayland
		ghostty
		telegram-desktop
		gtk2
		gtk3
		gtk4
		hiddify-app
		unzip
		zip
        hyprpanel
        sing-box
        bibata-cursors
        catppuccin-cursors.macchiatoBlue
        capitaine-cursors
        hyprshot
        libgcc
	];

	programs.hyprland.enable = true;
	programs.thunar.enable = true;

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    systemd.services.singbox = {
        description = "Sing-box Proxy Service";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        serviceConfig = {
          ExecStart = "/run/current-system/sw/bin/sing-box run -c /etc/singbox/config.json";
          Restart = "always";
          DynamicUser = false;
        };
    };


	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.11"; # Did you read the comment?

}
