{ config, pkgs, ... }:

{
    home.file.".config/hypr/hyprland.conf".source = ../../dotfiles/hypr/hyprland.conf;
 
    home.packages = with pkgs; [
        hyprpaper
        waybar
        kitty
        rofi-wayland
        swww
        hyprshot
        wl-clipboard
    ];
}
