{ config, pkgs, ... }: 

{
  services.displayManager.sddm.enable = true;

  services.displayManager.sddm.theme = "adwaita-dark";

  services.xserver.enable = true;

  services.displayManager.defaultSession = "hyprland";
}
