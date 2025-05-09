{ config, pkgs, ... }: 

let
    tokyo-night-sddm = pkgs.libsForQt5.callPackage ../../pkgs/sddm-theme.nix { };
in {
  services.displayManager.sddm.enable = true;
  
  services.displayManager.sddm.theme = "tokyo-night-sddm"; 
  environment.systemPackages = with pkgs; [ tokyo-night-sddm ]; 

  services.xserver.enable = true;

  services.displayManager.defaultSession = "hyprland";
}
