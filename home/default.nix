{ config, pkgs, ... }:

{
    imports = [
        ../modules/home/hyprland.nix
    ];

    home.username = "grizimin";
    home.homeDirectory = "/home/grizimin";

    ### THEME

    #gtk.enable = true;
    #gtk.theme.package = pkgs.adw-gtk3;
    #gtk.theme.name = "adw-gtk3";

    #qt.enable = true;
    #qt.platformTheme = "gtk";
    #qt.style.name = "adwaita-dark";

    home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Capitaine Cursors";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };

    home.file = {
        ".config/ghostty/config".source = ../dotfiles/ghostty/config;
        ".config/rofi/config.rasi".source = ../dotfiles/rofi/config.rasi;
        ".config/rofi/theme.rasi".source = ../dotfiles/rofi/theme.rasi;
    };
    home.sessionVariables = {
        NIXPKGS_ALLOW_UNFREE = "1";
        EDITOR = "nvim";
    };

    ### PROGRAMS

    home.stateVersion = "24.11"; 

    home.packages = with pkgs; [
        jetbrains.clion
    ];

    programs.neovim = {
        enable = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            gs = "git status";
            ll = "ls -l";
            update = "sudo nixos-rebuild switch --flake";
        };

        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "thefuck" ];
            theme = "robbyrussell";
        };

        history.size = 10000;
    };



    programs.git = {
        enable = true;
    };

    programs.home-manager.enable = true;
}
