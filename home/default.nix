{ config, pkgs, ... }:

{
    imports = [
        ../modules/home/hyprland.nix
    ];
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "grizimin";
    home.homeDirectory = "/home/grizimin";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.11"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = [
        pkgs.betaflight-configurator
    ];

    home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Capitaine Cursors";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
        ".config/ghostty/config".source = ../dotfiles/ghostty/config;
    };

    home.sessionVariables = {
        EDITOR = "neovim";
    };



    programs.zsh = {
        enable = true;
        enableCompletion = true;
        shellAliases = {
        gs = "git status";
        ll = "ls -l";
        };
    };

    programs.git = {
        enable = true;
    };

    programs.home-manager.enable = true;
}
