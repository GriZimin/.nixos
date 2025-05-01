{ config, pkgs, ... }:

{
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        open = false; # or true if you want to try open kernel module
        nvidiaSettings = true;
    };

    environment.variables = {
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        WLR_NO_HARDWARE_CURSORS = "1"; 
    };
}
