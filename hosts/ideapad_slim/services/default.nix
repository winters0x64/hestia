{ config, pkgs, ... }:

{

    # XDG portal
    xdg.portal = {
        enable = true;
        wlr.enable = true;
    };

    # Enables support for Bluetooth
    hardware.bluetooth.enable = true; 

    # Powers up the default Bluetooth controller on boot
    hardware.bluetooth.powerOnBoot = true; 
    
    # System services
    services = {
        # X11 
        xserver = {
            enable = true;
            layout = "us";
            xkbVariant = "";
            libinput.enable = true;
            displayManager.startx.enable = true;
            # DWM
            windowManager.dwm.enable = true;
            # SDDM
            displayManager.sddm.enable = true;
        };

        # Pipewire
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
    };

    # Power management
    services.upower.enable = true;   
}
