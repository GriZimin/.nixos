{
    boot.loader = {
        systemd-boot.enable = true;    
        timeout = 10;
        efi.canTouchEfiVariables = true;
    };
}
