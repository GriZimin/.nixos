# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
	[ 	
        ./hardware-configuration.nix
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

    programs.zsh.enable = true;

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
    boot.loader.timeout = 10;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixzimin"; 
    # networking.wireless.enable = true;  
	# networking.proxy.default = "127.0.0.1:2080";

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
        tree
        (callPackage ../../pkgs/sddm-theme.nix {}).sddm-sugar-dark
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

	system.stateVersion = "24.11"; 
}
