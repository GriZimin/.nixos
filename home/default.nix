{ config, pkgs, ... }:

{
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
        ".config/rofi/onedark.rasi".source = ../dotfiles/rofi/onedark.rasi;
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    ### PROGRAMS

    home.stateVersion = "24.11"; 


    programs.neovim = {
        enable = true;
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

    programs.git.enable = true;


    programs.home-manager.enable = true;
}
