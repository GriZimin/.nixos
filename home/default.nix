{ config, pkgs, ... }:

{
    imports = [
        ../modules/home/hyprland.nix
    ];
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "grizimin";
    home.homeDirectory = "/home/grizimin";

    home.stateVersion = "24.11"; 

    ### THEME

    gtk.enable = true;
    gtk.theme.package = pkgs.adw-gtk3;
    gtk.theme.name = "adw-gtk3";

    qt.enable = true;
    qt.platformTheme = "gtk";
    qt.style.name = "adwaita-dark";

    home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Capitaine Cursors";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };

    home.file = {
        ".config/ghostty/config".source = ../dotfiles/ghostty/config;
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    ### PROGRAMS

    home.packages = [
    ];

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
