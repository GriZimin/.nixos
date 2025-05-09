{ config, pkgs, ... }:

{
    imports = [
        ./default.nix
    ];

    home.username = "grizimin";
    home.homeDirectory = "/home/grizimin";

    home.packages = with pkgs; [
        jetbrains.clion
    ];

    programs.git = {
        userName  = "GriZimin";
        userEmail = "grizimin@gmail.com";
    };
}
