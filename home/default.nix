{ config, pkgs, ... }:

{
    ### THEME

    gtk.enable = true;
    #gtk.theme.package = pkgs.adw-gtk3;
    #gtk.theme.name = "adw-gtk3";

    qt.enable = true;
    qt.platformTheme.name = "gtk";

    home.file = {
        ".config/ghostty/config".source = ../dotfiles/ghostty/config;
        ".config/rofi/config.rasi".source = ../dotfiles/rofi/config.rasi;
        ".config/rofi/theme.rasi".source = ../dotfiles/rofi/theme.rasi;
        ".config/rofi/onedark.rasi".source = ../dotfiles/rofi/onedark.rasi;
    };

    home.pointerCursor = {
        gtk.enable = true; 
        x11.enable = true;
    };

    home.sessionVariables = {
        EDITOR = "nvim";
        XCURSOR_THEME = "Bibata-Modern-Ice";
        XCURSOR_SIZE = "24";
    };

    ### PROGRAMS

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
    home.stateVersion = "24.11"; 
}
