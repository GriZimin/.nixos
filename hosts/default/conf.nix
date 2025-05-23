# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports =
	[ 	
        ./hardware-configuration.nix
        ../../modules/system/hyprland.nix
        ../../modules/home/stylix.nix
        ../../modules/system/nvidia.nix
        ../../modules/system/sddm.nix
        ../../modules/system/singbox.nix
        ../../modules/system/bootloader.nix
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];


	networking.hostName = "nixzimin"; 
	#networking.proxy.default = "127.0.0.1:2080";
    # networking.wireless.enable = true;  

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
        shell = pkgs.zsh;
	};

	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
        home-manager
        wget
		git
		firefox
		rofi-wayland
		ghostty
		telegram-desktop
		gtk2
		gtk3
		gtk4
		unzip
		zip
        hyprpanel
        sing-box
        bibata-cursors
        libgcc
        tree
        legcord
        python3
        gcc
        bat
        neofetch
        nixfmt-rfc-style             
	];

	programs.thunar.enable = true;

    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];

	system.stateVersion = "24.11"; 
}
