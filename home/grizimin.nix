{ config, pkgs, ... }:

{
  imports = [
    ./default.nix
    ../modules/home/vscode.nix
    ../modules/home/hyprland.nix
    ../modules/home/stylix.nix
  ];

  home.username = "grizimin";
  home.homeDirectory = "/home/grizimin";

  home.packages = with pkgs; [
    thefuck
  ];

  programs.git = {
    userName = "GriZimin";
    userEmail = "grizimin@gmail.com";
  };
}
