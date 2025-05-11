{ config, pkgs, ... }: 

{
    stylix.enable = true;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

    stylix.image = ../../dotfiles/wallpapers/nixos.png;

    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Bibata-Modern-Ice";
    stylix.cursor.size = 24;
}
