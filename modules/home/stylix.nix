{ config, pkgs, ... }:

{
    stylix.enable = true;
    stylix.autoEnable = true;

    stylix.targets.hyprland.enable = true;
    stylix.targets.hyprpaper.enable = true;
    stylix.targets.neovim.enable = false;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    stylix.image = ../../dotfiles/wallpapers/nixos.png;
    stylix.polarity = "dark";

    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Bibata-Modern-Ice";
}
